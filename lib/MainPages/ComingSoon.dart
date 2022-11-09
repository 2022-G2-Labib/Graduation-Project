// ignore_for_file: file_names, use_key_in_widget_constructors, must_be_immutable, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:labib/MainPages/QuizSectionPage.dart';

import '../MainPages/HomePage.dart';
import '../PlacementQuiz/result.dart';

/* All Word lessons interface */
class ComingSoon extends StatelessWidget {
  String page = 'A';
  ComingSoon(this.page);
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
                    //blue background
                    left: 0.0,
                    top: 0.0,
                    right: null,
                    bottom: null,
                    child: Image.asset(
                      "assets/images/wordspage.png",
                      width: MediaQuery.of(context).size.width,
                      height: (MediaQuery.of(context).size.width * 1.78),
                    )),
                Positioned(
                    //back
                    left: MediaQuery.of(context).size.width * 0.056,
                    top: (MediaQuery.of(context).size.width * 3.7) * 0.026,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizSectionPage(page),
                              ));
                        },
                        child: Image.asset(
                          "assets/images/back.png",
                          width: MediaQuery.of(context).size.width * 0.039,
                          height:
                              (MediaQuery.of(context).size.width * 3.7) * 0.013,
                        ))),
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
