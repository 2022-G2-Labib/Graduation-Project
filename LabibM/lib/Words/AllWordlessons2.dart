// ignore_for_file: prefer_const_literals_to_create_immutables, file_names, use_key_in_widget_constructors, must_be_immutable, prefer_is_not_empty, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:labeeb_app/Words/WordMainSectionPage.dart';
import 'package:labeeb_app/Words/Wordslesson2.dart';
import '../DataBase/database_service.dart';
import '../HomePage.dart';
import '../DataBase/Lesson.dart';
import 'package:labeeb_app/PlacementQuiz/result.dart';

/* All Number lessons interface */
class AllWordlessons2 extends StatelessWidget {
  final DatabaseService _databaseService = DatabaseService();
  late List<Lesson> donelist;

  Future<bool> initAsync() async {
    List<Lesson> queryRows = await _databaseService.lessons();
    donelist = queryRows;
    if ((!donelist.isEmpty)) return true;
    return false;
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 1.78,
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                  //blue background
                  left: 0.0,
                  top: 0.0,
                  right: null,
                  bottom: null,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 1.78,
                  child: Image.asset(
                    "assets/images/blueBackground1.png",
                  )),
              Positioned(
                  //number lesson title
                  left: MediaQuery.of(context).size.width * 0.265,
                  top: (MediaQuery.of(context).size.width * 1.78) * 0.108,
                  right: null,
                  bottom: null,
                  child: Image.asset(
                    "assets/words/WordsInHealth.png",
                    width: MediaQuery.of(context).size.width * 0.398,
                    height: (MediaQuery.of(context).size.width * 1.78) * 0.048,
                  )),
              Positioned(
                  //back
                  left: MediaQuery.of(context).size.width * 0.056,
                  top: (MediaQuery.of(context).size.width * 1.78) * 0.055,
                  right: null,
                  bottom: null,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WordMainSectionPage(),
                            ));
                      },
                      child: Image.asset(
                        "assets/images/back.png",
                        width: MediaQuery.of(context).size.width * 0.039,
                        height:
                            (MediaQuery.of(context).size.width * 1.78) * 0.026,
                      ))),
              Positioned(
                  //Home button
                  left: MediaQuery.of(context).size.width * 0.462,
                  top: (MediaQuery.of(context).size.width * 1.78) * 0.88,
                  right: null,
                  bottom: null,
                  width: MediaQuery.of(context).size.width * 0.075,
                  height: (MediaQuery.of(context).size.width * 1.78) * 0.045,
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
              FutureBuilder<bool>(
                  future: initAsync(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    return Positioned(
                      child: Stack(children: [
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.169,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Wordslesson2('92'),
                                  ));
                            },
                            child: Image.asset('assets/words/w2/92' +
                                donelist[49].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.169,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Wordslesson2('93'),
                                  ));
                            },
                            child: Image.asset('assets/words/w2/93' +
                                donelist[50].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.169,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Wordslesson2('94'),
                                  ));
                            },
                            child: Image.asset('assets/words/w2/94' +
                                donelist[51].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.352,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Wordslesson2('95'),
                                  ));
                            },
                            child: Image.asset('assets/words/w2/95' +
                                donelist[52].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.352,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Wordslesson2('98'),
                                  ));
                            },
                            child: Image.asset('assets/words/w2/98' +
                                donelist[53].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.352,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Wordslesson2('100'),
                                  ));
                            },
                            child: Image.asset('assets/words/w2/100' +
                                donelist[54].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.534,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Wordslesson2('116'),
                                  ));
                            },
                            child: Image.asset('assets/words/w2/116' +
                                donelist[55].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.534,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Wordslesson2('117'),
                                  ));
                            },
                            child: Image.asset('assets/words/w2/117' +
                                donelist[56].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.534,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Wordslesson2('121'),
                                  ));
                            },
                            child: Image.asset('assets/words/w2/121' +
                                donelist[57].done.toString() +
                                '.png'),
                          ),
                        ),
                      ]),
                    );
                  }),
            ])),
      ),
    );
  }
}
