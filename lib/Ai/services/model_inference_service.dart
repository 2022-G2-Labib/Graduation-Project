import 'dart:isolate';

import 'package:camera/camera.dart';

import '../utils/isolate_utils.dart';
import 'ai_model.dart';
import 'section/letter_service.dart';
import 'section/number_service.dart';
import 'service_locator.dart';



class ModelInferenceService {
  late AiModel model;
  late Function handler;
  Map<String, dynamic>? inferenceResults;

  Future<Map<String, dynamic>?> inference({
    required IsolateUtils isolateUtils,
    required CameraImage cameraImage,
  }) async {
    final responsePort = ReceivePort();

    isolateUtils.sendMessage(
      handler: handler,
      params: {
        'cameraImage': cameraImage,
        'detectorAddress': model.getAddress,
      },
      sendPort: isolateUtils.sendPort,
      responsePort: responsePort,
    );

    inferenceResults = await responsePort.first;
    responsePort.close();
    return null;
  }

  
   void setModelConfig(String page) {
    switch (page) {
      case "A":
        model = locator<Letter>();
        handler = runHandDetector;
        break;
        case "B":
        model = locator<Number>();
        handler = runNumberDetector;
        break;
    }
  } 
}
