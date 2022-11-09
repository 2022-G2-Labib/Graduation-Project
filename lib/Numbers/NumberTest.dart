// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, file_names, use_key_in_widget_constructors, prefer_final_fields, sized_box_for_whitespace, non_constant_identifier_names, prefer_interpolation_to_compose_strings, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:labib/DataBase/DatabaseService.dart';
import 'dart:async';

import '../MainPages/HomePage.dart';
import '../PlacementQuiz/result.dart';

class NumberTest extends StatefulWidget {
  @override
  _NumberTest createState() => _NumberTest();
}

class _NumberTest extends State<NumberTest> {
  final DatabaseService _databaseService = DatabaseService();

  //setting text style
  TextStyle whiteText = TextStyle(color: Colors.white);
  bool hideTest = false;
  NumbersGame _game = NumbersGame();

  //game stats
  int tries = 0;
  int score = 0;
  int time = 60;
  Timer? timer;

  startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        setState(() {
          if (time > 0) {
            time--;
          } else {
            _time(score);
            timer?.cancel();
          }
          if (score == 8) {
            timer?.cancel();
          }
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _game.initGame();
    startTimer();
    _game.cards_list.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //background
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/PlacementQuiz/test_background.png'),
          fit: BoxFit.fill,
        ),
      ),

      child: Stack(
        children: [
          Positioned(
              //exit
              left: MediaQuery.of(context).size.width * 0.056,
              top: (MediaQuery.of(context).size.width * 1.78) * 0.055,
              right: null,
              bottom: null,
              child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor:
                                const Color.fromARGB(221, 237, 238, 237),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title: Center(
                                child: Text(
                              "هل تود الخروج من الاختبار؟",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.056,
                                  color: const Color.fromARGB(255, 36, 68, 95)),
                            )),
                            actions: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.31,
                                child: 	ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.check,
                                    color: Color.fromARGB(255, 36, 68, 95),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage(
                                                  score: Result.score,
                                                )));
                                    timer?.cancel();
                                  },
                                  label: const Text(
                                    " نعم ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 36, 68, 95)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.31,
                                child: 	ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Color.fromARGB(255, 36, 68, 95),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  label: const Text(
                                    " لا ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 36, 68, 95)),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: Image.asset(
                    "assets/exit.png",
                    width: MediaQuery.of(context).size.width * 0.039,
                    height: (MediaQuery.of(context).size.width * 1.78) * 0.026,
                  ))),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //pop
              Center(
                child: Text(
                  "لعبة الذاكرة",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Color.fromARGB(255, 0, 13, 81),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //   info_card("المحاولات", "$tries"),
                  info_card("النقاط", "$score"),
                  info_card("الوقت", "$time"),
                ],
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      itemCount: _game.gameImg!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, //counting how many box in row
                        crossAxisSpacing: 16.0, // spacing between boxs x
                        mainAxisSpacing: 16.0, // spacing between boxs x
                      ),
                      padding: EdgeInsets.all(16.0),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (_game.gameImg![index] == _game.hiddenCardpath) {
                              setState(() {
                                //incrementing the clicks
                                tries++;
                                print("First: " + _game.gameImg![index]);

                                _game.gameImg![index] = _game.cards_list[index];
                                print("Second" + _game.cards_list[index]);
                                _game.matchCheck
                                    .add({index: _game.cards_list[index]});
                                _game.matchCheck.first;
                              });
                              if (_game.matchCheck.length == 2) {
                                var fisrtIMG = _game.matchCheck[0].values.first
                                    .substring(18, 19);
                                var secIMG = _game.matchCheck[1].values.first
                                    .substring(18, 19);

                                if (fisrtIMG == secIMG) {
                                  score += 1;
                                  _game.matchCheck.clear();
                                } else {
                                  Future.delayed(Duration(milliseconds: 500),
                                      () {
                                    setState(() {
                                      _game.gameImg![_game.matchCheck[0].keys
                                          .first] = _game.hiddenCardpath;
                                      _game.gameImg![_game.matchCheck[1].keys
                                          .first] = _game.hiddenCardpath;
                                      _game.matchCheck.clear();
                                    });
                                  });
                                }
                              } //end if

                              _result(score);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 222, 222, 221),
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(_game.gameImg![index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ],
      ),
    ));
  }

  bool _result(int score) {
    String sc = score.toString();
    if (score == 8) {
      //pop
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(221, 237, 238, 237),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              title: Center(
                  child: Text(
                "احسنت! لقد اجتزت الاختبار \n حصلت على نتيجة $sc/8",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 36, 68, 95)),
              )),
              content: Image.asset(
                'assets/Happy.PNG',
                height: 130,
                width: 130,
              ),
              actions: [
                Container(
                  width: 140,
                  child: 	ElevatedButton.icon(
                    icon: Icon(
                      Icons.close,
                      color: Color.fromARGB(255, 36, 68, 95),
                    ),
                    onPressed: () {
                      update(score);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    score: Result.score,
                                  )));
                    },
                    label: Text(
                      " إغلاق ",
                      style: TextStyle(color: Color.fromARGB(255, 36, 68, 95)),
                    ),
                  ),
                ),
              ],
            );
          });
    } //end if
    return true;
  }

  Widget info_card(String title, String info) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 26.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(106, 211, 209, 209),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22.0,
                color: Color.fromARGB(238, 0, 14, 81),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              info,
              style: TextStyle(
                fontSize: 34.0,
                color: Color.fromARGB(238, 0, 13, 81),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _time(int score) {
    String sc = score.toString();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(221, 237, 238, 237),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: Center(
                child: Text(
              "!انتهى الوقت \n حصلت على نتيجة $sc/8",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 36, 68, 95)),
            )),
            content: Image.asset(
              'assets/Sad.PNG',
              height: 150,
              width: 150,
            ),
            actions: [
              Container(
                width: 140,
                child: 	ElevatedButton.icon(
                  icon: Icon(
                    Icons.close,
                    color: Color.fromARGB(255, 36, 68, 95),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  score: Result.score,
                                )));
                  },
                  label: Text(
                    " إغلاق ",
                    style: TextStyle(color: Color.fromARGB(255, 36, 68, 95)),
                  ),
                ),
              ),
              Container(
                width: 140,
                child: 	ElevatedButton.icon(
                  icon: Icon(
                    Icons.refresh,
                    color: Color.fromARGB(255, 36, 68, 95),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NumberTest(),
                        ));
                    //);
                  },
                  label: Text(
                    "اعد المحاولة",
                    style: TextStyle(color: Color.fromARGB(255, 36, 68, 95)),
                  ),
                ),
              ),
            ],
          );
        });
    return true;
  }

  Future<void> update(int testResult) async {
    await _databaseService.updateTestResult('numbersTest',testResult,'GameGrade');
  }
}

class NumbersGame {
  List<String>? gameImg;
  final String hiddenCardpath = "assets/NumberTest/hidden.png";
  List<String> cards_list = [
    "assets/NumberTest/2.png",
    "assets/NumberTest/6.png",
    "assets/NumberTest/5.png",
    "assets/NumberTest/9.png",
    "assets/NumberTest/2text.png",
    "assets/NumberTest/5text.png",
    "assets/NumberTest/0.png",
    "assets/NumberTest/6text.png",
    "assets/NumberTest/9text.png",
    "assets/NumberTest/0text.png",
    "assets/NumberTest/1text.png",
    "assets/NumberTest/3text.png",
    "assets/NumberTest/8text.png",
    "assets/NumberTest/1.png",
    "assets/NumberTest/3.png",
    "assets/NumberTest/8.png",
  ];
  final int cardCount = 16;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
