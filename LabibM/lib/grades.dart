// ignore_for_file: prefer_final_fields, must_be_immutable, camel_case_types, sized_box_for_whitespace, prefer_is_not_empty, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:labeeb_app/DataBase/database_service.dart';
import 'HomePage.dart';
import 'PlacementQuiz/result.dart';

class grades extends StatefulWidget {
  static bool numbersspassedTest = false;
  static bool letterspassedTest = false;

  @override
  State<grades> createState() => _gradesState();
}

class _gradesState extends State<grades> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final DatabaseService _databaseService = DatabaseService();

  String letter = 'لم تجتاز';
  String number = 'لم تجتاز';
  String word = 'لم تجتاز';

  late Map<String, dynamic> result;
  Future<bool> initAsync() async {
    result = await _databaseService.retrieveTestResult();
    if (!result.isEmpty) return true;
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<bool>(
        future: initAsync(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            if (result['lettersTest'] == 7) {
              letter = " اجتزت";
              grades.letterspassedTest = true;
            }

            if (result['numbersTest'] == 4) {
              number = " اجتزت";
              grades.numbersspassedTest = true;
            }

            if (result['wordsTest'] == 9) {
              word = " اجتزت  ";
            }

            return Scaffold(
              key: _scaffoldKey,
              body: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 1.78,
                    child: Stack(children: [
                      Positioned(
                          //blue background
                          left: 0.0,
                          top: 0.0,
                          right: null,
                          bottom: null,
                          child: Image.asset(
                            "assets/grades/grades.png",
                            width: MediaQuery.of(context).size.width,
                            height: (MediaQuery.of(context).size.width * 1.78),
                          )),
                      Positioned(
                          //back button
                          left: MediaQuery.of(context).size.width * 0.056,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.055,
                          right: null,
                          bottom: null,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(
                                              score: Result.score,
                                            )));
                              },
                              child: Image.asset(
                                "assets/images/back.png",
                                width:
                                    MediaQuery.of(context).size.width * 0.039,
                                height:
                                    (MediaQuery.of(context).size.width * 1.78) *
                                        0.026,
                              ))),
                      Positioned(
                        //Letter Button
                        left: MediaQuery.of(context).size.width * 0.04,
                        top: (MediaQuery.of(context).size.width * 1.78) * 0.434,
                        right: null,
                        bottom: null,
                        child: Image.asset(
                          "assets/grades/lettQuizButton.png",
                          width: MediaQuery.of(context).size.width * 0.88,
                          height: (MediaQuery.of(context).size.width * 1.78) *
                              0.1125,
                        ),
                      ),
                      Positioned(
                        //Letter result
                        left: MediaQuery.of(context).size.width * 0.15,
                        top: (MediaQuery.of(context).size.width * 1.78) * 0.467,
                        right: null,
                        bottom: null,
                        child: Text(
                          letter,
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.0613,
                            color: const Color.fromARGB(255, 1, 12, 69),
                          ),
                        ),
                      ),
                      Positioned(
                        //Numbers Button
                        left: MediaQuery.of(context).size.width * 0.04,
                        top: (MediaQuery.of(context).size.width * 1.78) * 0.578,
                        right: null,
                        bottom: null,

                        child: Image.asset(
                          "assets/grades/numQuizbutton.png",
                          width: MediaQuery.of(context).size.width * 0.88,
                          height: (MediaQuery.of(context).size.width * 1.78) *
                              0.1125,
                        ),
                      ),
                      Positioned(
                        //Numbers result
                        left: MediaQuery.of(context).size.width * 0.15,
                        top: (MediaQuery.of(context).size.width * 1.78) * 0.609,
                        right: null,
                        bottom: null,
                        child: Text(
                          number,
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.0613,
                            color: const Color.fromARGB(255, 1, 12, 69),
                          ),
                        ),
                      ),
                      Positioned(
                        //words Button
                        left: MediaQuery.of(context).size.width * 0.04,
                        top: (MediaQuery.of(context).size.width * 1.78) * 0.727,
                        right: null,
                        bottom: null,
                        child: Image.asset(
                          "assets/grades/wordQuizButton.png",
                          width: MediaQuery.of(context).size.width * 0.88,
                          height: (MediaQuery.of(context).size.width * 1.78) *
                              0.1125,
                        ),
                      ),
                      Positioned(
                        //words result
                        left: MediaQuery.of(context).size.width * 0.15,
                        top: (MediaQuery.of(context).size.width * 1.78) * 0.759,
                        right: null,
                        bottom: null,
                        child: Text(
                          word,
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.0613,
                            color: const Color.fromARGB(255, 1, 12, 69),
                          ),
                        ),
                      ),
                      Positioned(
                          //Home button
                          left: MediaQuery.of(context).size.width * 0.462,
                          top:
                              (MediaQuery.of(context).size.width * 1.78) * 0.85,
                          right: null,
                          bottom: null,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(
                                              score: Result.score,
                                            )));
                              },
                              child: Image.asset(
                                "assets/images/Home.png",
                                width:
                                    MediaQuery.of(context).size.width * 0.075,
                                height:
                                    (MediaQuery.of(context).size.width * 1.78) *
                                        0.045,
                              ))),
                    ]),
                  ),
                ],
              ),
              
            );
         
          }
        },
      ),
    );
    
  }

}
