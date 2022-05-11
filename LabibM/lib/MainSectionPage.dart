// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, prefer_const_constructors, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:labeeb_app/DataBase/Lesson.dart';
import 'package:labeeb_app/DataBase/database_service.dart';
import 'HomePage.dart';
import 'QuizSectionPage.dart';
import 'PlacementQuiz/result.dart';

class MainSectionPage extends StatelessWidget {
  final DatabaseService _databaseService = DatabaseService();

  String page = 'A';
  MainSectionPage(this.page);

  Future<int> checkDone() async {
    List<Lesson> queryRows = await _databaseService.lessons();

    int length = 0;
    int i = 0;
    if (page == 'A') {
      length = 27;
      i = 0;
    } else {
      if (page == 'B') {
        length = 37;
        i = 28;
      } else {
        if (page == 'C') {
          length = 57;
          i = 38;
        }
      }
    }

    int count = 0;
    for (i; i <= length; i++) {
      count += queryRows[i].done;
    }

    switch (page) {
      case 'A':
        {
          if (count == 28) {
            return 1;
          } else {
            return 0;
          }
        }

      case 'B':
        {
          if (count == 10) {
            return 1;
          } else {
            return 0;
          }
        }
      case 'C':
        {
          if (count == 20) {
            return 1;
          } else {
            return 0;
          }
        }

      default:
        {
          return 0;
        }
    }
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 1.78,
              child: Stack(children: [
                Positioned(
                    //Page background
                    left: 0.0,
                    top: 0.0,
                    right: null,
                    bottom: null,
                    child: Image.asset(
                      "assets/MainSectionPage/MainSectionPage.png",
                      width: MediaQuery.of(context).size.width,
                      height: (MediaQuery.of(context).size.width * 1.78),
                    )),
                Positioned(
                    //back button
                    left: MediaQuery.of(context).size.width * 0.056,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.055,
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
                          width: MediaQuery.of(context).size.width * 0.039,
                          height: (MediaQuery.of(context).size.width * 1.78) *
                              0.026,
                        ))),
                Positioned(
                    //lesson button
                    left: MediaQuery.of(context).size.width * 0.047,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.468,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, "/Generated" + page),
                      child: Image.asset(
                        "assets/MainSectionPage/lessonButton.png",
                        width: MediaQuery.of(context).size.width * 0.90,
                        height:
                            (MediaQuery.of(context).size.width * 1.78) * 0.125,
                      ),
                    )),
                Positioned(
                    //quiz Button
                    left: MediaQuery.of(context).size.width * 0.047,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.65,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () async {
                        int i = await checkDone();
                        if (i == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizSectionPage(page)));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor:
                                      Color.fromARGB(221, 237, 238, 237),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  title: Center(
                                      child: Text(
                                    "عذرًا! يجب أن تنهي جميع الدروس حتى تستطيع إجراء الاختبار",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 36, 68, 95)),
                                  )),
                                  content: Image.asset(
                                    'assets/Sad.PNG',
                                    height: 150,
                                    width: 150,
                                  ),
                                  actions: [
                                    Container(
                                      width: 140,
                                      child: RaisedButton.icon(
                                        icon: Icon(
                                          Icons.close,
                                          color:
                                              Color.fromARGB(255, 36, 68, 95),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        label: Text(
                                          " إغلاق ",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 36, 68, 95)),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                      child: Image.asset(
                        "assets/MainSectionPage/quizButton.png",
                        width: MediaQuery.of(context).size.width * 0.90,
                        height:
                            (MediaQuery.of(context).size.width * 1.78) * 0.125,
                      ),
                    )),
                Positioned(
                    //Home button
                    left: MediaQuery.of(context).size.width * 0.462,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.85,
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
                          width: MediaQuery.of(context).size.width * 0.075,
                          height: (MediaQuery.of(context).size.width * 1.78) *
                              0.045,
                        ))),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
