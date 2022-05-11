// ignore_for_file: unrelated_type_equality_checks, annotate_overrides, prefer_const_constructors, avoid_print, use_key_in_widget_constructors, camel_case_types

import 'HomePage.dart';
import 'Words/WordsTest.dart';
import 'Numbers/NumberTest.dart';
import 'Letters/lettersTest.dart';
import 'PlacementQuiz/result.dart';
import 'PlacementQuiz/testPage.dart';
import 'package:flutter/material.dart';
import 'DataBase/database_service.dart';
import 'package:labeeb_app/ComingSoon.dart';
import 'package:labeeb_app/Letters/AllLetterlessons.dart';
import 'package:labeeb_app/Numbers/AllNumberlessons.dart';
import 'package:labeeb_app/Words/WordMainSectionPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(StartApp());
}

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'Cairo',
            ),
            debugShowCheckedModeBanner: false,
            home: StartPage(),
            routes: {
              '/GeneratedA': (context) => AllLetterlessons(),
              '/GeneratedB': (context) => AllNumberlessons(),
              '/GeneratedC': (context) => WordMainSectionPage(),
              '/GeneratedATest': (context) => lettersTest('A'),
              '/GeneratedBTest': (context) => NumberTest(),
              '/GeneratedCTest': (context) => WordsTest(),
              '/GeneratedAAI': (context) => ComingSoon('A'),
              '/GeneratedBAI': (context) => ComingSoon('B'),
              '/GeneratedCAI': (context) => ComingSoon('C'),
            },
          );
        });
  }
}

class StartPage extends StatelessWidget {
  final DatabaseService _databaseService = DatabaseService();

  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<bool>(
          future: _databaseService.cheaktest(),
          builder: (context, snapshot) {
            if (snapshot.data != true) {
              return Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/PlacementQuiz/background_fi.png"),
                          fit: BoxFit.fill)),
                  child: Center(
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
                ),
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
