// ignore_for_file: prefer_final_fields, must_be_immutable, camel_case_types, sized_box_for_whitespace, prefer_is_not_empty, use_key_in_widget_constructors, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:labib/DataBase/DatabaseService.dart';
import 'HomePage.dart';
import '../PlacementQuiz/result.dart';

class grades extends StatefulWidget {
  static bool numbersspassedTest = false;
  static bool letterspassedTest = false;

  @override
  State<grades> createState() => _gradesState();
}

class _gradesState extends State<grades> {
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/grades/grades.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Positioned(
              //back button
              left: width * 0.056,
              top: (height) * 0.055,
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
                    width: width * 0.039,
                    height: (height) * 0.026,
                  ))),
          Positioned(
            //Letter square
            left: width * 0.04,
            top: (height) * 0.434,
            right: null,
            bottom: null,
            child: Image.asset(
              "assets/grades/lettQuizButton.png",
              width: width * 0.88,
              height: (height) * 0.1125,
            ),
          ),
          Positioned(
            //Numbers square
            left: width * 0.04,
            top: (height) * 0.578,
            right: null,
            bottom: null,

            child: Image.asset(
              "assets/grades/numQuizbutton.png",
              width: width * 0.88,
              height: (height) * 0.1125,
            ),
          ),
          Positioned(
            //words square
            left: width * 0.04,
            top: (height) * 0.727,
            right: null,
            bottom: null,
            child: Image.asset(
              "assets/grades/wordQuizButton.png",
              width: width * 0.88,
              height: (height) * 0.1125,
            ),
          ),
          Positioned(
              //Home button
              left: width * 0.462,
              top: height * 0.88,
              right: null,
              bottom: null,
              width: width * 0.075,
              height: height * 0.045,
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
                  ))),
          FutureBuilder<bool>(
              future: initAsync(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (result['LettersGame'] == 7) {
                    letter = " اجتزت";
                    grades.letterspassedTest = true;
                  }

                  if (result['NumbersGame'] == 8) {
                    number = " اجتزت";
                    grades.numbersspassedTest = true;
                  }

                  if (result['wordsGame'] == 9) {
                    word = " اجتزت  ";
                  }

                  return Stack(children: [
                    Positioned(
                      //Letter result
                      left: width * 0.15,
                      top: (height) * 0.467,
                      right: null,
                      bottom: null,
                      child: Text(
                        letter,
                        style: TextStyle(
                          fontSize: width * 0.0613,
                          color: const Color.fromARGB(255, 1, 12, 69),
                        ),
                      ),
                    ),
                    Positioned(
                      //Numbers result
                      left: width * 0.15,
                      top: (height) * 0.609,
                      right: null,
                      bottom: null,
                      child: Text(
                        number,
                        style: TextStyle(
                          fontSize: width * 0.0613,
                          color: const Color.fromARGB(255, 1, 12, 69),
                        ),
                      ),
                    ),
                    Positioned(
                      //words result
                      left: width * 0.15,
                      top: (height) * 0.759,
                      right: null,
                      bottom: null,
                      child: Text(
                        word,
                        style: TextStyle(
                          fontSize: width * 0.0613,
                          color: const Color.fromARGB(255, 1, 12, 69),
                        ),
                      ),
                    ),
                  ]);
                }
              }),
        ]),
      ),
    );
  }
}
