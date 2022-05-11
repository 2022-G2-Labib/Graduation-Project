// ignore_for_file: sized_box_for_whitespace, prefer_final_fields, must_be_immutable, camel_case_types, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:labeeb_app/ExtraResourses/pdfIslam.dart';
import 'package:labeeb_app/ExtraResourses/pdfAtlas.dart';
import '../HomePage.dart';
import '../PlacementQuiz/result.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class resourcesPage extends StatelessWidget {
  final String score;

  resourcesPage({Key? key, required this.score}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
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
                      "assets/ress/resourcesPage.png",
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
                    //islamic book button
                    left: MediaQuery.of(context).size.width * 0.7,
                    top: (MediaQuery.of(context).size.width * 3.0) * 0.43,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => pdfIslam(
                                        score: Result.score,
                                      )));
                        },
                        child: Image.asset(
                          "assets/ress/book.png",
                          width: MediaQuery.of(context).size.width * 0.22,
                          height:
                              (MediaQuery.of(context).size.width * 0.22) * 1,
                        ))),
                Positioned(
                    //media book button
                    left: MediaQuery.of(context).size.width * 0.7,
                    top: (MediaQuery.of(context).size.width * 1.9) * 0.43,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => pdfAtlas(
                                        score: Result.score,
                                      )));
                        },
                        child: Image.asset(
                          "assets/ress/book.png",
                          width: MediaQuery.of(context).size.width * 0.22,
                          height:
                              (MediaQuery.of(context).size.width * 0.22) * 1,
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
