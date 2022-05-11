// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:labeeb_app/HomePage.dart';
import 'package:labeeb_app/MainSectionPage.dart';
import 'package:labeeb_app/PlacementQuiz/result.dart';
import 'package:labeeb_app/Words/AllWordlessons.dart';
import 'package:labeeb_app/Words/AllWordlessons2.dart';

class WordMainSectionPage extends StatelessWidget {
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
                                builder: (context) => MainSectionPage('C'),
                              ));
                        },
                        child: Image.asset(
                          "assets/images/back.png",
                          width: MediaQuery.of(context).size.width * 0.039,
                          height: (MediaQuery.of(context).size.width * 1.78) *
                              0.026,
                        ))),
                Positioned(
                    //section 1 button
                    left: MediaQuery.of(context).size.width * 0.047,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.468,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllWordlessons(),
                            ));
                      },
                      child: Image.asset(
                        "assets/words/GeneralWordsSection.png",
                        width: MediaQuery.of(context).size.width * 0.90,
                        height:
                            (MediaQuery.of(context).size.width * 1.78) * 0.125,
                      ),
                    )),
                Positioned(
                    //section 2 button
                    left: MediaQuery.of(context).size.width * 0.047,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.65,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllWordlessons2(),
                            ));
                      },
                      child: Image.asset(
                        "assets/words/WordsInHealthSection.png",
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
