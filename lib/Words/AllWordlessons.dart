// ignore_for_file: prefer_const_literals_to_create_immutables, file_names, use_key_in_widget_constructors, must_be_immutable, prefer_is_not_empty, prefer_final_fields, prefer_const_constructors, non_constant_identifier_names
import '../MainPages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:labib/Words/Wordslesson.dart';
import 'package:labib/PlacementQuiz/result.dart';
import 'package:labib/DataBase/DatabaseService.dart';
import 'package:labib/MainPages/WordMainSectionPage.dart';

class AllWordlessons extends StatefulWidget {
  late String Section;
  AllWordlessons(this.Section);
  @override
  State<AllWordlessons> createState() => _AllWordlessonsState();
}

class _AllWordlessonsState extends State<AllWordlessons> {
  final DatabaseService _databaseService = DatabaseService();

  late Map<String, dynamic> donelist;

  Future<bool> initAsync() async {
    Map<String, dynamic> queryRows = await _databaseService.lessons('words');
    donelist = queryRows;
    if ((!donelist.isEmpty)) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (widget.Section == 'A') {
                      return Stack(children: [
                        Positioned(
                            //General Words title
                            left: MediaQuery.of(context).size.width * 0.292,
                            top: (MediaQuery.of(context).size.width * 1.78) *
                                0.0718,
                            right: null,
                            bottom: null,
                            child: Image.asset(
                              "assets/words/GeneralWords.png",
                              width: MediaQuery.of(context).size.width * 0.4206,
                              height:
                                  (MediaQuery.of(context).size.width * 1.78) *
                                      0.0828,
                            )),
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
                                    builder: (context) =>
                                        Wordslesson('290', widget.Section),
                                  ));
                            },
                            child: Image.asset(
                                'assets/words/290${donelist['290']}.png'),
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
                                    builder: (context) =>
                                        Wordslesson('293', widget.Section),
                                  ));
                            },
                            child: Image.asset(
                                'assets/words/293${donelist['293']}.png'),
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
                                    builder: (context) =>
                                        Wordslesson('288', widget.Section),
                                  ));
                            },
                            child: Image.asset(
                                'assets/words/288${donelist['288']}.png'),
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
                                    builder: (context) =>
                                        Wordslesson('287', widget.Section),
                                  ));
                            },
                            child: Image.asset(
                                'assets/words/287${donelist['287']}.png'),
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
                                    builder: (context) =>
                                        Wordslesson('273', widget.Section),
                                  ));
                            },
                            child: Image.asset(
                                'assets/words/273${donelist['273']}.png'),
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
                                    builder: (context) =>
                                        Wordslesson('277', widget.Section),
                                  ));
                            },
                            child: Image.asset(
                                'assets/words/277${donelist['277']}.png'),
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
                                    builder: (context) =>
                                        Wordslesson('226', widget.Section),
                                  ));
                            },
                            child: Image.asset(
                                'assets/words/226${donelist['226']}.png'),
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
                                    builder: (context) =>
                                        Wordslesson('227', widget.Section),
                                  ));
                            },
                            child: Image.asset(
                                'assets/words/227${donelist['227']}.png'),
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
                                    builder: (context) =>
                                        Wordslesson('162', widget.Section),
                                  ));
                            },
                            child: Image.asset(
                                'assets/words/162${donelist['162']}.png'),
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
                                    builder: (context) =>
                                        Wordslesson('161', widget.Section),
                                  ));
                            },
                            child: Image.asset(
                                'assets/words/161${donelist['161']}.png'),
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
                                    builder: (context) =>
                                        Wordslesson('160', widget.Section),
                                  ));
                            },
                            child: Image.asset(
                                'assets/words/160${donelist['160']}.png'),
                          ),
                        ),
                      ]);
                    } else {
                      return Positioned(
                        child: Stack(children: [
                          Positioned(
                              //WordsIn Health title
                              left: MediaQuery.of(context).size.width * 0.2089,
                              top: (MediaQuery.of(context).size.width * 1.78) *
                                  0.0718,
                              right: null,
                              bottom: null,
                              child: Image.asset(
                                "assets/words/WordsInHealth.png",
                                width:
                                    MediaQuery.of(context).size.width * 0.6017,
                                height:
                                    (MediaQuery.of(context).size.width * 1.78) *
                                        0.0875,
                              )),
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
                                      builder: (context) =>
                                          Wordslesson('92', widget.Section),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/words/92${donelist['92']}.png'),
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
                                      builder: (context) =>
                                          Wordslesson('93', widget.Section),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/words/93${donelist['93']}.png'),
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
                                      builder: (context) =>
                                          Wordslesson('94', widget.Section),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/words/94${donelist['94']}.png'),
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
                                      builder: (context) =>
                                          Wordslesson('95', widget.Section),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/words/95${donelist['95']}.png'),
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
                                      builder: (context) =>
                                          Wordslesson('98', widget.Section),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/words/98${donelist['98']}.png'),
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
                                      builder: (context) =>
                                          Wordslesson('100', widget.Section),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/words/100${donelist['100']}.png'),
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
                                      builder: (context) =>
                                          Wordslesson('116', widget.Section),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/words/116${donelist['116']}.png'),
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
                                      builder: (context) =>
                                          Wordslesson('117', widget.Section),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/words/117${donelist['117']}.png'),
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
                                      builder: (context) =>
                                          Wordslesson('121', widget.Section),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/words/121${donelist['121']}.png'),
                            ),
                          ),
                        ]),
                      );
                    }
                  }),
            ])),
      ),
    );
  }
}
