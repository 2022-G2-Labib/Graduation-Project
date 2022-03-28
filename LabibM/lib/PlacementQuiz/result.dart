import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'testPage.dart';
import 'package:labeeb_app/HomePage.dart';
import 'testPage.dart';

class Result extends StatelessWidget {
  final int points;
  static String score = "";
  const Result({Key? key, required this.points}) : super(key: key);

  Widget build(BuildContext context) {
    var result = 10;
    String res = result.toString();
    String p = points.toString();
    score = _result(points);

    return Scaffold(
      body: Container(
          //background
          padding: EdgeInsets.all(9),
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/PlacementQuiz/Result.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(children: <Widget>[
            Container(
              child: Column(children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 40,
                    ),
                    onPressed: () {
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
                    padding: EdgeInsets.all(9),
                    margin: EdgeInsets.all(10),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 10,
                        width: 80,
                      ),
                      Text(
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
                    padding: EdgeInsets.all(9),
                    margin: EdgeInsets.all(1),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 5,
                        width: 10,
                      ),
                      Text(
                        p + '/10 :لقد حصلت على',
                        style: TextStyle(
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
                    padding: EdgeInsets.all(1),
                    margin: EdgeInsets.all(1),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 1,
                        width: 1,
                      ),
                      Text(
                        ' مستواك الحالي: ' + score,
                        style: TextStyle(
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
                  padding: EdgeInsets.all(1),
                  margin: EdgeInsets.all(1),
                  child: Center(
                      child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround, //button position
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("",
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
                        child: Text(
                          " ابدأ التعلم",
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
