// ignore_for_file: sized_box_for_whitespace, prefer_final_fields, must_be_immutable, camel_case_types, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:labib/ExtraResourses/pdfIslam.dart';
import 'package:labib/ExtraResourses/pdfAtlas.dart';
import '../MainPages/HomePage.dart';
import '../PlacementQuiz/result.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class resourcesPage extends StatelessWidget {
  final String score;

  resourcesPage({Key? key, required this.score}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/ress/resourcesPage.png"),
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
                            builder: (context) => HomePage(
                                  score: Result.score,
                                )));
                  },
                  child: Image.asset(
                    "assets/images/back.png",
                    width: width * 0.039,
                    height: height * 0.026,
                  ))),
          Positioned(
              //islamic book button
              left: width * 0.7,
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
                    width: width * 0.22,
                    height: width * 0.22,
                  ))),
          Positioned(
              //media book button
              left: width * 0.7,
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
                    width: width * 0.22,
                    height: width * 0.22,
                  ))),
          Positioned(
              //Home button
              left: width * 0.462,
              top: height * 0.94,
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
        ]),
      ),
    );
  }
}
