// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, prefer_is_not_empty

import 'package:flutter/material.dart';
import 'package:labib/DataBase/DatabaseService.dart';
import 'package:labib/MainPages/QuizSectionPage.dart';
import 'HomePage.dart';
import '../PlacementQuiz/result.dart';

class AiQuizSectionPage extends StatefulWidget {
  String page = 'A';
  AiQuizSectionPage(this.page);

  @override
  State<AiQuizSectionPage> createState() => _AiQuizSectionPageState();
}

class _AiQuizSectionPageState extends State<AiQuizSectionPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final DatabaseService _databaseService = DatabaseService();
  late int grade;

  Future<bool> initAsync() async {
    Map<String, dynamic> result = await _databaseService.retrieveTestResult();
    grade = result['AiATest'];

    if (!result.isEmpty) return true;
    return false;
  }

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
            image: AssetImage("assets/ai/Aisection.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
                //back
                left: width * 0.056,
                top: height * 0.055,
                right: null,
                bottom: null,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizSectionPage(widget.page),
                          ));
                    },
                    child: Image.asset(
                      "assets/images/back.png",
                      width: width * 0.039,
                      height: height * 0.026,
                    ))),
            Positioned(
                left: width * 0.047,
                top: height * 0.468,
                right: null,
                bottom: null,
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, "/Generated${widget.page}1AI"),
                  child: Image.asset(
                    "assets/ai/levelOne.png",
                    width: width * 0.90,
                    height: height * 0.125,
                  ),
                )),
            Positioned(
                //level two Button
                left: width * 0.047,
                top: height * 0.65,
                right: null,
                bottom: null,
                child: GestureDetector(
                  onTap: () async {
                    await initAsync();
                    if (grade < 4) {
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
                                ' عذرًا! يجب أن تجتاز اختبار المرحلة الأولى حتى تنتقل للمستوى التالي',
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
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'إغلاق',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 36, 68, 95)),
                                    ))
                              ],
                            );
                          });
                    } //end if
                    else {
                      Navigator.pushNamed(
                          context, "/Generated${widget.page}2AI");
                    }
                  },
                  child: Image.asset(
                    "assets/ai/levelTwo.png",
                    width: width * 0.90,
                    height: height * 0.125,
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
          ],
        ),
      ),
    ));
  }
}
