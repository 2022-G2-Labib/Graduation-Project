// ignore_for_file: prefer_const_literals_to_create_immutables, file_names, use_key_in_widget_constructors, must_be_immutable, prefer_is_not_empty, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:labeeb_app/Words/WordMainSectionPage.dart';
import 'package:labeeb_app/Words/Wordslesson.dart';
import '../DataBase/database_service.dart';
import '../HomePage.dart';
import '../DataBase/Lesson.dart';
import 'package:labeeb_app/PlacementQuiz/result.dart';

/* All Number lessons interface */
class AllWordlessons extends StatelessWidget {
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
                    "assets/words/GeneralWords.png",
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
                                    builder: (context) => Wordslesson('290'),
                                  ));
                            },
                            child: Image.asset('assets/words/w1/290' +
                                donelist[38].done.toString() +
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
                                    builder: (context) => Wordslesson('293'),
                                  ));
                            },
                            child: Image.asset('assets/words/w1/293' +
                                donelist[39].done.toString() +
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
                                    builder: (context) => Wordslesson('288'),
                                  ));
                            },
                            child: Image.asset('assets/words/w1/288' +
                                donelist[40].done.toString() +
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
                                    builder: (context) => Wordslesson('287'),
                                  ));
                            },
                            child: Image.asset('assets/words/w1/287' +
                                donelist[41].done.toString() +
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
                                    builder: (context) => Wordslesson('273'),
                                  ));
                            },
                            child: Image.asset('assets/words/w1/273' +
                                donelist[42].done.toString() +
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
                                    builder: (context) => Wordslesson('277'),
                                  ));
                            },
                            child: Image.asset('assets/words/w1/277' +
                                donelist[43].done.toString() +
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
                                    builder: (context) => Wordslesson('226'),
                                  ));
                            },
                            child: Image.asset('assets/words/w1/226' +
                                donelist[44].done.toString() +
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
                                    builder: (context) => Wordslesson('227'),
                                  ));
                            },
                            child: Image.asset('assets/words/w1/227' +
                                donelist[45].done.toString() +
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
                                    builder: (context) => Wordslesson('162'),
                                  ));
                            },
                            child: Image.asset('assets/words/w1/162' +
                                donelist[46].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.717,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Wordslesson('161'),
                                  ));
                            },
                            child: Image.asset('assets/words/w1/161' +
                                donelist[47].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.717,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Wordslesson('160'),
                                  ));
                            },
                            child: Image.asset('assets/words/w1/160' +
                                donelist[48].done.toString() +
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
