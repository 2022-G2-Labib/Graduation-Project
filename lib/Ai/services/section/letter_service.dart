// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:image/image.dart' as image_lib;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:collection/collection.dart';

import '../../utils/image_utils.dart';
import '../ai_model.dart';

// ignore: must_be_immutable
class Letter extends AiModel {
  Letter({this.interpreter}) {
    loadModel();
  }

  final int inputSize = 64;
  final double exist_threshold = 0.1;
  final double score_threshold = 0.3;
  late List<String> labels = [
    "ain",
    "al",
    "aleff",
    "bb",
    "dal",
    "dha",
    "dhad",
    "fa",
    "gaaf",
    "ghain",
    "ha",
    "haa",
    "jeem",
    "kaaf",
    "khaa",
    "la",
    "laam",
    "meem",
    "nun",
    "ra",
    "saad",
    "seen",
    "sheen",
    "ta",
    "taa",
    "thaa",
    "thal",
    "toot",
    "waw",
    "ya",
    "yaa",
    "zay"
  ];


  Interpreter? interpreter;

  late var _probabilityProcessor;

  NormalizeOp get preProcessNormalizeOp => NormalizeOp(127.5, 127.5);

  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 1);

  @override
  List<Object> get props => [];

  @override
  int get getAddress => interpreter!.address;

  @override
  Future<void> loadModel() async {
    try {
      final interpreterOptions = InterpreterOptions();
      interpreter ??= await Interpreter.fromAsset('models/keras_model.tflite',
          options: interpreterOptions);

      final outputTensors = interpreter!.getOutputTensors();

      outputTensors.forEach((tensor) {
        outputShapes.add(tensor.shape);
        outputTypes.add(tensor.type);
      });

      _probabilityProcessor =
          TensorProcessorBuilder().add(postProcessNormalizeOp).build();
    } catch (e) {
      print('Error while creating interpreter: $e');
    }
  }

  @override
  TensorImage getProcessedImage(TensorImage inputImage) {
    final imageProcessor = ImageProcessorBuilder()
        .add(ResizeOp(inputSize, inputSize, ResizeMethod.BILINEAR))
        .add(NormalizeOp(0, 255))
        .build();

    inputImage = imageProcessor.process(inputImage);
    return inputImage;
  }

  @override
  Map<String, dynamic>? predict(image_lib.Image image) {
    if (interpreter == null) {
      print('Interpreter not initialized');
      return null;
    }

    if (Platform.isAndroid) {
      image = image_lib.copyRotate(image, -90);
      image = image_lib.flipHorizontal(image);
    }

    final tensorImage = TensorImage(TfLiteType.float32);
    tensorImage.loadImage(image);
    final inputImage = getProcessedImage(tensorImage);

    final inputs = <Object>[inputImage.buffer];

    TensorBuffer result = TensorBufferFloat(outputShapes[0]);

    final outputs = <int, Object>{
      0: result.buffer,
    };

    interpreter!.runForMultipleInputs(inputs, outputs);

    Map<String, double> labeledProb =
        TensorLabel.fromList(labels, _probabilityProcessor.process(result))
            .getMapWithFloatValue();
    final pred = getTopProbability(labeledProb);

    return {'key': pred.key, 'value': pred.value};
  }
}

MapEntry<String, double> getTopProbability(Map<String, double> labeledProb) {
  var pq = PriorityQueue<MapEntry<String, double>>(compare);
  pq.addAll(labeledProb.entries);

  return pq.first;
}

int compare(MapEntry<String, double> e1, MapEntry<String, double> e2) {
  if (e1.value > e2.value) {
    return -1;
  } else if (e1.value == e2.value) {
    return 0;
  } else {
    return 1;
  }
}

Map<String, dynamic>? runHandDetector(Map<String, dynamic> params) {
  final letter = Letter(
    interpreter: Interpreter.fromAddress(params['detectorAddress']),
  );
  final image = ImageUtils.convertCameraImage(params['cameraImage']);
  final result = letter.predict(image!);


  return result;
}
