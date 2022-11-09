// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:labib/MainPages/AiQuizSectionPage.dart';
import 'package:labib/MainPages/MainSectionPage.dart';
import 'HomePage.dart';
import '../PlacementQuiz/result.dart';

class QuizSectionPage extends StatelessWidget {
  String page = 'A';
  QuizSectionPage(this.page);

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
              image: AssetImage("assets/QuizSectionPage/QuizSectionPage.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
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
                            builder: (context) => MainSectionPage(page),
                          ));
                    },
                    child: Image.asset(
                      "assets/images/back.png",
                      width: width * 0.039,
                      height: height * 0.026,
                    ))),
            Positioned(
                //Game quiz button
                left: width * 0.047,
                top: height * 0.468,
                right: null,
                bottom: null,
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, "/Generated${page}Test"),
                  child: Image.asset(
                    "assets/QuizSectionPage/Gamequiz.png",
                    width: width * 0.90,
                    height: height * 0.125,
                  ),
                )),
            Positioned(
                //AI quiz button
                left: width * 0.047,
                top: height * 0.65,
                right: null,
                bottom: null,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    (context),
                    MaterialPageRoute(
                        builder: (context) => AiQuizSectionPage(page)),
                  ),
                  child: Image.asset(
                    "assets/QuizSectionPage/AIquiz.png",
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
          ]),
        ),
      ),
    );
  }
}
