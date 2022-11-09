// ignore_for_file: avoid_unnecessary_containers, curly_braces_in_flow_control_structures, annotate_overrides, unused_local_variable, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_interpolation_to_compose_strings, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:labib/MainPages/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Result extends StatelessWidget {
  int points;
  static String score = "";

  Result(this.points, {Key? key}) : super(key: key) {
    score = _result(points);
  }
  Widget build(BuildContext context) {
    //  var result = 10;
    // String res = result.toString();
    String result = points.toString();

    return Scaffold(
      body: Container(
          //background
          padding: const EdgeInsets.all(9),
          margin: const EdgeInsets.all(1),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/PlacementQuiz/Result.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(children: <Widget>[
            Container(
              child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 40,
                    ),
                    onPressed: () async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setBool("placement", true);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    score: score,
                                  )));
                    },
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(9),
                    margin: const EdgeInsets.all(10),
                    child: Column(children: <Widget>[
                      const SizedBox(
                        height: 10,
                        width: 80,
                      ),
                      const Text(
                        '!احسنت',
                        style: TextStyle(
                          //fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          fontSize: 28,
                          color: Color.fromARGB(255, 36, 68, 95),
                        ),
                      ),
                    ])),
                Container(
                    padding: const EdgeInsets.all(9),
                    margin: const EdgeInsets.all(1),
                    child: Column(children: <Widget>[
                      const SizedBox(
                        height: 5,
                        width: 10,
                      ),
                      Text(
                        result + '/10 :لقد حصلت على',
                        style: const TextStyle(
                          //fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          color: Color.fromARGB(255, 36, 68, 95),
                        ),
                      ),
                    ])),
                Container(
                    padding: const EdgeInsets.all(1),
                    margin: const EdgeInsets.all(1),
                    child: Column(children: <Widget>[
                      const SizedBox(
                        height: 1,
                        width: 1,
                      ),
                      Text(
                        ' مستواك الحالي: ' + score,
                        style: const TextStyle(
                          //fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          color: Color.fromARGB(255, 36, 68, 95),
                        ),
                      ),
                    ])),
                Container(
                  padding: const EdgeInsets.all(1),
                  margin: const EdgeInsets.all(1),
                  child: Center(
                      child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround, //button position
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("",
                          style: TextStyle(
                              height: 20,
                              color: Color.fromARGB(255, 255, 255, 255))),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                        score: score,
                                      )));
                        },
                        child: const Text(
                          " ابدأ التعلم",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 36, 68, 95),
                          fixedSize: const Size(200, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  )),
                ),
              ]),
            ),
          ])),
    );
  }

  String _result(int points) {
    if (points <= 9) {
      return "مبتدئ";
    } else
      return "متقدم";
  }

  
}
