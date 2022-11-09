// ignore_for_file: unnecessary_statements

import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../../DataBase/DatabaseService.dart';
import '../../MainPages/AiQuizSectionPage.dart';
import '../services/model_inference_service.dart';
import '../services/service_locator.dart';
import '../utils/isolate_utils.dart';
import 'StartScreen.dart';

class LettersAi2 extends StatefulWidget {
  LettersAi2({
    required this.page,
  });
  final String page;

  @override
  _LettersAi2State createState() => _LettersAi2State();
}

class _LettersAi2State extends State<LettersAi2> with WidgetsBindingObserver {
  CameraController? _cameraController;
  late IsolateUtils _isolateUtils;
  late ModelInferenceService _modelInferenceService;
  late List<CameraDescription> _cameras;
  late CameraDescription _cameraDescription;
  final DatabaseService _databaseService = DatabaseService();

  bool _isRun = false;
  bool _predicting = false;
  bool _draw = false;
  bool timeout = false;
  bool correct = false;

  int qIndex = 1;
  Color answerColor = Color.fromARGB(255, 255, 105, 94);
  Color buttonColor = Colors.black;
  String answerText = " ";
  int correctAnsCounter = 0;

  Timer? countdownTimer;
  int time = 120;
  var seconds = 60;
  int score = 0;

  List<String> qAlist = [
    "ي",
    "غ",
    "ن",
    "ج",
    "م",
  ];
  List<String> qElist = [
    "yaa",
    "ghain",
    "nun",
    "jeem",
    "meem",
  ];

  @override
  void initState() {
    _modelInferenceService = locator<ModelInferenceService>();
    _initStateAsync();
    super.initState();
  }

  void _initStateAsync() async {
    _isolateUtils = IsolateUtils();
    await _isolateUtils.initIsolate();
    await _initCamera();
    _predicting = false;
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _cameraController = null;

    if (_modelInferenceService.inferenceResults != null)
      _modelInferenceService.inferenceResults == null;
    countdownTimer?.cancel();
    super.dispose();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    _cameraDescription = _cameras[1];
    _isRun = false;
    _onNewCameraSelected(_cameraDescription);
  }

  void _onNewCameraSelected(CameraDescription cameraDescription) async {
    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    _cameraController!.addListener(() {
      if (mounted) setState(() {});
      if (_cameraController!.value.hasError) {
        _showInSnackBar(
            'Camera error ${_cameraController!.value.errorDescription}');
      }
    });

    try {
      await _cameraController!.initialize().then((value) {
        if (!mounted) return;
      });
    } on CameraException catch (e) {
      _showInSnackBar('Error: ${e.code}\n${e.description}');
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _showInSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void startTimer() {
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        setState(() {
          if (seconds > 0) {
            seconds--;
          } else {
            timeout = true;
          }
        });
      },
    );
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => {seconds = 60});
  }

  bool done = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    if (_modelInferenceService.inferenceResults != null && _isRun && !correct) {
      String answer =
          _modelInferenceService.inferenceResults!['key'].toString();
      var value = _modelInferenceService.inferenceResults!['value'];

      if (!correct) {
        print(_modelInferenceService.inferenceResults);
        print(qElist[qIndex - 1]);
        if (answer == qElist[qIndex - 1] && value > 0.85) {
          ++correctAnsCounter;
        } else {
          correctAnsCounter = -1;
        }
      }

      switch (correctAnsCounter) {
        case (-1):
          {
            if (answerColor == Color.fromARGB(255, 255, 105, 94)) {
              answerColor = Color.fromARGB(239, 71, 6, 0);
            } else {
              answerColor = Color.fromARGB(255, 255, 105, 94);
            }
            answerText = "حاول مجدداً";
          }
          break;
        case (0):
          {
            answerText = "";
          }
          break;
        case 1:
          {
            answerColor = Color.fromRGBO(37, 183, 95, 1);
            answerText = "أحسنت ";
            correct = true;
            correctAnsCounter = 0;
            stopTimer();
          }
          break;
      }
    }

    //if camera not found return "CircularProgressIndicator()"
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    //test ended
    if (done && score == 5) {
      return Scaffold(
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ai/end.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(children: [
                Positioned(
                    //exit button
                    left: width * 0.2228,
                    top: height * 0.7296,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                        onTap: () async {
                          if (_isRun) {
                            _imageStreamToggle;
                          }

                          await _databaseService.updateTestResult(
                              'lettersTest', score, 'AiGrade2');

                          dispose();
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) =>
                                    AiQuizSectionPage(widget.page)),
                          );
                        },
                        child: Image.asset(
                          "assets/ai/exit2.png",
                          width: width * 0.5348,
                          height: height * 0.1093,
                        ))),
              ])));
    }
    if (done && score < 5) {
      return Scaffold(
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ai/endLoss.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(children: [
                Positioned(
                    //exit button
                    left: width * 0.0668,
                    top: height * 0.7625,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                        onTap: () async {
                          await _databaseService.updateTestResult(
                              'lettersTest', score, 'AiGrade2');

                          if (_isRun) {
                            _imageStreamToggle;
                          }

                          dispose();
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) =>
                                    AiQuizSectionPage(widget.page)),
                          );
                        },
                        child: Image.asset(
                          "assets/ai/exit2.png",
                          width: width * 0.37,
                          height: height * 0.079225,
                        ))),
                Positioned(
                    //try again button
                    left: width * 0.5849,
                    top: height * 0.7625,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                        onTap: () async {
                          if (_isRun) {
                            _imageStreamToggle;
                          }

                          dispose();
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => StartScreen(
                                      level: '2',
                                      page: widget.page,
                                    )),
                          );
                        },
                        child: Image.asset("assets/ai/again.png",
                            width: width * 0.38, height: height * 0.08))),
              ])));
    }
    //start test
    return WillPopScope(
        onWillPop: () async {
          _imageStreamToggle;
          Navigator.pop(context);
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ai/background2.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  //Row
                  Positioned(
                      left: 0,
                      top: height * 0.8641,
                      right: null,
                      bottom: null,
                      width: width,
                      height: height * 0.1359,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () => _cameraDirectionToggle,
                            color: Colors.black,
                            iconSize: 30.0,
                            icon: const Icon(
                              Icons.cameraswitch,
                            ),
                          ),
                          Text(
                            answerText,
                            style: TextStyle(
                                color: answerColor,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () => _imageStreamToggle,
                            color: buttonColor,
                            iconSize: 30.0,
                            icon: const Icon(
                              Icons.filter_center_focus,
                            ),
                          ),
                        ],
                      )),

                  //Question text
                  Positioned(
                    left: 0,
                    top: height * 0.1281,
                    right: null,
                    bottom: null,
                    width: width,
                    height: height * 0.0843,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(width * 0.0278),
                        child: Center(
                          child: Text(
                            " قم بتمثيل حرف " + qAlist[qIndex - 1],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: width * 0.0557,
                                color: Color.fromRGBO(0, 13, 81, 1)),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Exit button in the corner
                  Positioned(
                      left: width * 0.0222,
                      top: height * 0.0312,
                      right: null,
                      bottom: null,
                      child: GestureDetector(
                          onTap: () {
                            showDialog(
                              barrierColor: Color.fromARGB(204, 0, 0, 0),
                              context: context,
                              builder: (BuildContext context) {
                                Widget cancelButton = TextButton(
                                  child: Text(
                                    "إلغاء",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 13, 81, 1)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                                Widget continueButton = TextButton(
                                  child: Text("خروج",
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 13, 81, 1))),
                                  onPressed: () {
                                    dispose();
                                    Navigator.push(
                                      (context),
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AiQuizSectionPage(widget.page)),
                                    );
                                  },
                                );

                                // set up the AlertDialog
                                AlertDialog alert = AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 217, 217, 217),
                                  content: Text(
                                    "هل متاكد انك تريد الخروج من الاختبار ؟",
                                  ),
                                  actions: [
                                    cancelButton,
                                    continueButton,
                                  ],
                                );

                                return alert;
                              },
                            );
                          },
                          child: Image.asset(
                            "assets/ai/exit.png",
                            width: width * 0.3,
                            height: height * 0.06,
                          ))),

                  //Circle
                  Positioned(
                      left: width * 0.7938,
                      top: height * 0.0125,
                      right: null,
                      bottom: null,
                      child: Image.asset(
                        "assets/ai/circle.png",
                        width: width * 0.167,
                        height: width * 0.167,
                      )),

                  //Question number
                  Positioned(
                    left: width * 0.82,
                    top: height * 0.045,
                    right: null,
                    bottom: null,
                    child: Text(
                      "$qIndex/5",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: width * 0.05013,
                          color: Color.fromRGBO(0, 13, 81, 1)),
                    ),
                  ),

                  //Camera view
                  Positioned(
                    left: width * 0.0501,
                    top: height * 0.2125,
                    right: null,
                    bottom: null,
                    height: height * 0.6484,
                    width: width * 0.9136,
                    child: Container(
                      height: height * 0.6484,
                      width: width * 0.9136,
                      child: AspectRatio(
                        aspectRatio: _cameraController!.value.aspectRatio,
                        child: CameraPreview(
                          _cameraController!,
                        ),
                      ),
                    ),
                  ),

                  //Skip question button
                  Positioned(
                      left: width * 0.8797,
                      top: height * 0.1456,
                      right: null,
                      bottom: null,
                      child: GestureDetector(
                          onTap: () {
                            showDialog(
                              barrierColor: Color.fromARGB(204, 0, 0, 0),
                              context: context,
                              builder: (BuildContext context) {
                                Widget cancelButton = TextButton(
                                  child: Text(
                                    "إلغاء",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 13, 81, 1)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                                Widget continueButton = TextButton(
                                  child: Text("تأكيد",
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 13, 81, 1))),
                                  onPressed: () {
                                    setState(() {
                                      if (qIndex < 5) {
                                        if (seconds < 60) {
                                          resetTimer();
                                        }
                                        if (_isRun) {
                                          _imageStreamToggle;
                                        }
                                        correct = false;
                                        correctAnsCounter = 0;
                                        ++qIndex;
                                        answerText = "";
                                      } else {
                                        done = true;
                                      }

                                      Navigator.of(context).pop();
                                    });
                                  },
                                );

                                // set up the AlertDialog
                                AlertDialog alert = AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 217, 217, 217),
                                  content: Text(
                                    "هل متاكد انك تود الانتقال للسؤال التالي ؟",
                                  ),
                                  actions: [
                                    cancelButton,
                                    continueButton,
                                  ],
                                );

                                return alert;
                              },
                            );
                          },
                          child: Image.asset(
                            "assets/ai/next.png",
                            width: width * 0.06,
                            height: height * 0.06,
                          ))),

                  //Timer text
                  Positioned(
                    left: 0,
                    top: height * 0.2100,
                    right: null,
                    bottom: null,
                    width: width,
                    height: height * 0.0843,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(width * 0.0278),
                        child: Center(
                          child: Text(
                            '00:$seconds',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.0501,
                                color: Color.fromRGBO(0, 13, 81, 1)),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Correct answer alert
                  Positioned(
                    left: width * 0.0724,
                    top: height * 0.2828,
                    right: null,
                    bottom: null,
                    width: width * 0.8746,
                    height: height * 0.4531,
                    child: Visibility(
                      child: Stack(children: [
                        Positioned(
                            //Correct Alert
                            child: Image.asset(
                          "assets/ai/correct.png",
                          width: width * 0.8746,
                          height: height * 0.4531,
                        )),
                        Positioned(
                            //Next button
                            left: (width * 0.8746) * 0.5891,
                            top: (height * 0.4531) * 0.7448,
                            right: null,
                            bottom: null,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (qIndex < 5) {
                                      if (seconds < 60) {
                                        resetTimer();
                                      }
                                      if (_isRun) {
                                        _imageStreamToggle;
                                      }

                                      correct = false;
                                      correctAnsCounter = 0;
                                      ++qIndex;
                                      score = score + 1;
                                      answerText = "";
                                    } else {
                                      done = true;
                                    }
                                  });
                                },
                                child: Image.asset(
                                  "assets/ai/next2.png",
                                  width: width * 0.3342,
                                  height: height * 0.0718,
                                ))),
                        Positioned(
                            //Exit quiz button
                            left: (width * 0.8746) * 0.025,
                            top: (height * 0.4531) * 0.7448,
                            right: null,
                            bottom: null,
                            child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    barrierColor: Color.fromARGB(204, 0, 0, 0),
                                    context: context,
                                    builder: (BuildContext context) {
                                      Widget cancelButton = TextButton(
                                        child: Text(
                                          "إلغاء",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 13, 81, 1)),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                      Widget continueButton = TextButton(
                                        child: Text("خروج",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 13, 81, 1))),
                                        onPressed: () {
                                          stopTimer();
                                          dispose();
                                          Navigator.push(
                                            (context),
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AiQuizSectionPage(
                                                        widget.page)),
                                          );
                                        },
                                      );

                                      // set up the AlertDialog
                                      AlertDialog alert = AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        backgroundColor:
                                            Color.fromARGB(255, 217, 217, 217),
                                        content: Text(
                                          "هل متاكد انك تريد الخروج من الاختبار ؟",
                                        ),
                                        actions: [
                                          cancelButton,
                                          continueButton,
                                        ],
                                      );
                                      return alert;
                                    },
                                  );
                                },
                                child: Image.asset(
                                  "assets/ai/exit2.png",
                                  width: width * 0.3342,
                                  height: height * 0.07187,
                                ))),
                      ]),
                      visible: correct,
                    ),
                  ),

                  //Timeout alert
                  Positioned(
                    left: width * 0.0724,
                    top: height * 0.2828,
                    right: null,
                    bottom: null,
                    width: width * 0.8746,
                    height: height * 0.4531,
                    child: Visibility(
                      child: Stack(children: [
                        Positioned(
                            child: Image.asset(
                          "assets/ai/timeout.png",
                          width: width * 0.8746,
                          height: height * 0.4531,
                        )),
                        Positioned(
                            //Next button
                            left: (width * 0.8746) * 0.5891,
                            top: (height * 0.4531) * 0.7448,
                            right: null,
                            bottom: null,
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (qIndex < 5) {
                                      ++qIndex;
                                      correctAnsCounter = 0;
                                      if (!_isRun) {
                                        _imageStreamToggle;
                                      }
                                      if (seconds < 60) {
                                        resetTimer();
                                      }
                                      answerText = "";
                                    } else {
                                      done = true;
                                    }

                                    timeout = false;
                                  });
                                },
                                child: Image.asset(
                                  "assets/ai/next2.png",
                                  width: width * 0.3342,
                                  height: height * 0.0718,
                                ))),
                        Positioned(
                            //Exit quiz button
                            left: (width * 0.8746) * 0.025,
                            top: (height * 0.4531) * 0.7448,
                            right: null,
                            bottom: null,
                            child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    barrierColor: Color.fromARGB(204, 0, 0, 0),
                                    context: context,
                                    builder: (BuildContext context) {
                                      Widget cancelButton = TextButton(
                                        child: Text(
                                          "إلغاء",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 13, 81, 1)),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                      Widget continueButton = TextButton(
                                        child: Text("خروج",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 13, 81, 1))),
                                        onPressed: () {
                                          stopTimer();
                                          dispose();
                                          Navigator.push(
                                            (context),
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AiQuizSectionPage(
                                                        widget.page)),
                                          );
                                        },
                                      );

                                      // set up the AlertDialog
                                      AlertDialog alert = AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        backgroundColor:
                                            Color.fromARGB(255, 217, 217, 217),
                                        content: Text(
                                          "هل متاكد انك تريد الخروج من الاختبار ؟",
                                        ),
                                        actions: [
                                          cancelButton,
                                          continueButton,
                                        ],
                                      );
                                      return alert;
                                    },
                                  );
                                },
                                child: Image.asset(
                                  "assets/ai/exit2.png",
                                  width: width * 0.3342,
                                  height: height * 0.07187,
                                ))),
                      ]),
                      visible: timeout,
                    ),
                  ),
                ],
              )),
        ));
  }

  void get _imageStreamToggle {
    setState(() {
      _draw = !_draw;
    });

    //_isrun was true -> convert to false
    _isRun = !_isRun;

    //_isRun is false use inverse _isrun
    if (!_isRun) {
      buttonColor = Colors.black;
      answerText = "";
      stopTimer();
      _cameraController!.stopImageStream();
      //is run is false
    } else {
      buttonColor = Color.fromARGB(255, 77, 106, 137);
      startTimer();
      _cameraController!.startImageStream(
        (CameraImage cameraImage) async =>
            await _inference(cameraImage: cameraImage),
      );
    }
  }

  void get _cameraDirectionToggle {
    setState(() {
      _draw = false;
    });

    _isRun = false;
    if (_cameraController!.description.lensDirection ==
        _cameras.first.lensDirection) {
      _onNewCameraSelected(_cameras.last);
    } else {
      _onNewCameraSelected(_cameras.first);
    }
  }

  Future<void> _inference({required CameraImage cameraImage}) async {
    if (!mounted) return;

    if (_modelInferenceService.model.interpreter != null) {
      if (_predicting || !_draw) {
        return;
      }

      setState(() {
        _predicting = true;
      });

      if (_draw) {
        await _modelInferenceService.inference(
          isolateUtils: _isolateUtils,
          cameraImage: cameraImage,
        );
      }

      setState(() {
        _predicting = false;
      });
    }
  }
}
