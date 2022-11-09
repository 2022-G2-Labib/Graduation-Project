// ignore_for_file: file_names, must_be_immutable, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:labib/MainPages/HomePage.dart';
import 'package:labib/MainPages/MainSectionPage.dart';
import 'package:labib/PlacementQuiz/result.dart';
import 'package:labib/Words/AllWordlessons.dart';

class WordMainSectionPage extends StatelessWidget {
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
              image: AssetImage("assets/MainSectionPage/MainSectionPage.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
            Positioned(
                //back button
                left: width * 0.056,
                top: height* 0.055,
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
                      width: width * 0.039,
                      height: height* 0.026,
                    ))),
            Positioned(
                //section 1 button
                left: width * 0.047,
                top: height* 0.468,
                right: null,
                bottom: null,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllWordlessons('A'),
                        ));
                  },
                  child: Image.asset(
                    "assets/words/GeneralWordsSection.png",
                    width: width * 0.90,
                    height: height* 0.125,
                  ),
                )),
            Positioned(
                //section 2 button
                left: width * 0.047,
                top: height* 0.65,
                right: null,
                bottom: null,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllWordlessons('B'),
                        ));
                  },
                  child: Image.asset(
                    "assets/words/WordsInHealthSection.png",
                    width: width * 0.90,
                    height: height* 0.125,
                  ),
                )),
            Positioned(
                //Home button
                left: width * 0.462,
                top: height* 0.85,
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
                      height: height* 0.045,
                    ))),
          ]),
        ),
      ),
    );
  }
}
