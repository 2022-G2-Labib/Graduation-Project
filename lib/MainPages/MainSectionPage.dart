// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, file_names, must_be_immutable, use_key_in_widget_constructors, prefer_final_fields, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:labib/DataBase/DatabaseService.dart';
import 'package:labib/MainPages/HomePage.dart';
import 'package:labib/PlacementQuiz/result.dart';
import 'QuizSectionPage.dart';

class MainSectionPage extends StatefulWidget {
  late String page;
  MainSectionPage(this.page);

  @override
  State<MainSectionPage> createState() => _MainSectionPageState();
}

class _MainSectionPageState extends State<MainSectionPage> {
  final DatabaseService _databaseService = DatabaseService();

  Future<int> checkDone() async {
    Map<String, dynamic> queryRows = await _databaseService.checkDone();
    switch (widget.page) {
      case 'A':
        {
          if (queryRows['letters'] == 28) {
            return 1;
          } else {
            return 0;
          }
        }

      case 'B':
        {
          if (queryRows['numbers'] == 10) {
            return 1;
          } else {
            return 0;
          }
        }
      case 'C':
        {
          if (queryRows['words'] == 20) {
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage( "assets/MainSectionPage/MainSectionPage.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
            Positioned(
                //back button
                left: width * 0.056,
                top: height * 0.055,
                right: null,
                bottom: null,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(score: Result.score)));
                    },
                    child: Image.asset(
                      "assets/images/back.png",
                      width: width * 0.039,
                      height: height * 0.026,
                    ))),
            Positioned(
                //lesson button
                left: width * 0.047,
                top: height * 0.468,
                right: null,
                bottom: null,
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, "/Generated${widget.page}"),
                  child: Image.asset(
                    "assets/MainSectionPage/lessonButton.png",
                    width: width * 0.90,
                    height: (MediaQuery.of(context).size.width * 1.78) * 0.125,
                  ),
                )),
            Positioned(
                //quiz Button
                left: width * 0.047,
                top: height * 0.65,
                right: null,
                bottom: null,
                child: GestureDetector(
                  onTap: () async {
                    int i = await checkDone();
                    if (i == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  QuizSectionPage(widget.page)));
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
                                  child: ElevatedButton.icon(
                                    icon: Icon(
                                      Icons.close,
                                      color: Color.fromARGB(255, 36, 68, 95),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    label: Text(
                                      " إغلاق ",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 36, 68, 95)),
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
                    width: width * 0.90,
                    height: (MediaQuery.of(context).size.width * 1.78) * 0.125,
                  ),
                )),
            Positioned(
                //Home button
                left: width * 0.462,
                top: height * 0.85,
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
                      width: width * 0.075,
                      height: height * 0.045,
                    ))),
          ]),
        ),
      ),
    );
  }
}
