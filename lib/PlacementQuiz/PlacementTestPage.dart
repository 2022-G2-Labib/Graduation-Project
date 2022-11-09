// ignore_for_file: prefer_const_constructors, sort_child_properties_last, file_names, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:labib/PlacementQuiz/result.dart';
import 'package:labib/PlacementQuiz/testPage.dart';
import 'package:labib/DataBase/DatabaseService.dart';
import '../MainPages/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PlacementTestPage extends StatelessWidget {
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: FutureBuilder<bool>(
          future: _databaseService.cheakPlacmenttest('placementTest'),
          builder: (context, snapshot) {
            if (snapshot.data != true) {
              return Scaffold(
                body: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/PlacementQuiz/background_fi.png"),
                            fit: BoxFit.cover)),
                    child: Stack(children: [
                      Positioned(
                          //Skip
                          left: width * 0.7,
                          top: height * 0.029,
                          right: null,
                          bottom: null,
                          child: GestureDetector(
                              onTap: () async{
                                Result(-1);
                                 SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setBool("placement", true);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(
                                              score: Result.score,
                                            )));
                              },
                              child: Image.asset(
                                "assets/welcomePage/skipTest2.png",
                                width: width * 0.3099,
                                height: height * 0.0810,
                                 fit:BoxFit.fill
                              ))),
                      Center(
                          child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround, //button position
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("",
                              style: TextStyle(
                                  height: 30,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          // Spacer(),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TestPage()));
                            },
                            child: Text(
                              " بدء اختبار تحديد المستوى",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 36, 68, 95),
                              fixedSize: const Size(200, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ],
                      )),
                    ])),
              );
            } else {
              return HomePage(
                score: Result.score,
              );
            }
          }),
    );
  }
}
