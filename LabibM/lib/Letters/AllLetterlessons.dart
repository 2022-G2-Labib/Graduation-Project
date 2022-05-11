// ignore_for_file: unnecessary_const, file_names, must_be_immutable, use_key_in_widget_constructors, prefer_is_not_empty, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:labeeb_app/MainSectionPage.dart';
import '../HomePage.dart';
import '../DataBase/Lesson.dart';
import '../DataBase/database_service.dart';
import 'package:labeeb_app/PlacementQuiz/result.dart';
import 'package:labeeb_app/Letters/Letterslesson.dart';

/*All Letter lessons interface */
class AllLetterlessons extends StatelessWidget {
  final DatabaseService _databaseService = DatabaseService();
  late List<Lesson> donelist;

  Future<bool> initAsync() async {
    List<Lesson> queryRows = await _databaseService.lessons();
    donelist = queryRows;
    return true;
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
            height: MediaQuery.of(context).size.width * 3.7,
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                  //blue background
                  left: 0.0,
                  top: 0.0,
                  right: null,
                  bottom: null,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 3.7,
                  child: Image.asset(
                    "assets/images/blueBackground2.png",
                  )),
              Positioned(
                  //letter lesson title
                  left: MediaQuery.of(context).size.width * 0.265,
                  top: (MediaQuery.of(context).size.width * 3.7) * 0.050,
                  right: null,
                  bottom: null,
                  child: Image.asset(
                    "assets/images/letterLesson.png",
                    width: MediaQuery.of(context).size.width * 0.398,
                    height: (MediaQuery.of(context).size.width * 3.7) * 0.023,
                  )),
              Positioned(
                  //back
                  left: MediaQuery.of(context).size.width * 0.056,
                  top: (MediaQuery.of(context).size.width * 3.7) * 0.026,
                  right: null,
                  bottom: null,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainSectionPage('A'),
                            ));
                      },
                      child: Image.asset(
                        "assets/images/back.png",
                        width: MediaQuery.of(context).size.width * 0.039,
                        height:
                            (MediaQuery.of(context).size.width * 3.7) * 0.013,
                      ))),
              Positioned(
                  //Home button
                  left: MediaQuery.of(context).size.width * 0.462,
                  top: (MediaQuery.of(context).size.width * 3.7) * 0.974,
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
                        height:
                            (MediaQuery.of(context).size.width * 3.7) * 0.023,
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
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.082,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('A'),
                                  ));
                            },
                            child: Image.asset('assets/images/Asmall' +
                                donelist[0].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.082,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('B'),
                                  ));
                            },
                            child: Image.asset('assets/images/Bsmall' +
                                donelist[1].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.082,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('T'),
                                  ));
                            },
                            child: Image.asset('assets/images/Tsmall' +
                                donelist[2].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.169,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Th'),
                                  ));
                            },
                            child: Image.asset('assets/images/Thsmall' +
                                donelist[3].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.169,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('G'),
                                  ));
                            },
                            child: Image.asset('assets/images/Gsmall' +
                                donelist[4].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.169,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Ha'),
                                  ));
                            },
                            child: Image.asset('assets/images/Hasmall' +
                                donelist[5].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.258,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Tha'),
                                  ));
                            },
                            child: Image.asset('assets/images/Thasmall' +
                                donelist[8].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.258,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Kha'),
                                  ));
                            },
                            child: Image.asset('assets/images/Khsmall' +
                                donelist[6].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.258,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('D'),
                                  ));
                            },
                            child: Image.asset('assets/images/Dsmall' +
                                donelist[7].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.346,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('R'),
                                  ));
                            },
                            child: Image.asset('assets/images/Rsmall' +
                                donelist[9].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.353,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.346,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Z'),
                                  ));
                            },
                            child: Image.asset('assets/images/Zsmall' +
                                donelist[10].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.346,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('S'),
                                  ));
                            },
                            child: Image.asset('assets/images/Ssmall' +
                                donelist[11].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.014,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.434,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Sh'),
                                  ));
                            },
                            child: Image.asset('assets/images/Shsmall' +
                                donelist[12].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.345,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.434,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Ss'),
                                  ));
                            },
                            child: Image.asset('assets/images/Sssmall' +
                                donelist[13].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.677,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.433,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Da'),
                                  ));
                            },
                            child: Image.asset('assets/images/Dasmall' +
                                donelist[14].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.014,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.522,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Ta'),
                                  ));
                            },
                            child: Image.asset('assets/images/Tasmall' +
                                donelist[15].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.345,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.522,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Tt'),
                                  ));
                            },
                            child: Image.asset('assets/images/Ttasmall' +
                                donelist[16].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.677,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.522,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Ain'),
                                  ));
                            },
                            child: Image.asset('assets/images/Ainsmall' +
                                donelist[17].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.014,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.610,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Ain2'),
                                  ));
                            },
                            child: Image.asset('assets/images/Ain2small' +
                                donelist[18].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.677,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.610,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Kaf'),
                                  ));
                            },
                            child: Image.asset('assets/images/Kafsmall' +
                                donelist[20].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.345,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.610,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('F'),
                                  ));
                            },
                            child: Image.asset('assets/images/Fsmall' +
                                donelist[19].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.014,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.699,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('K'),
                                  ));
                            },
                            child: Image.asset('assets/images/Ksmall' +
                                donelist[21].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.345,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.699,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Lam'),
                                  ));
                            },
                            child: Image.asset('assets/images/Lamsmall' +
                                donelist[22].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.677,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.699,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('M'),
                                  ));
                            },
                            child: Image.asset('assets/images/Msmall' +
                                donelist[23].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.786,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('N'),
                                  ));
                            },
                            child: Image.asset('assets/images/Nsmall' +
                                donelist[24].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.786,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('H'),
                                  ));
                            },
                            child: Image.asset('assets/images/Hsmall' +
                                donelist[25].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.786,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('W'),
                                  ));
                            },
                            child: Image.asset('assets/images/Wsmall' +
                                donelist[26].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.880,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Letterslesson('Y'),
                                  ));
                            },
                            child: Image.asset('assets/images/Ysmall' +
                                donelist[27].done.toString() +
                                '.png'),
                          ),
                        )
                      ]),
                    );
                  }),
            ])),
      ),
    );
  }
}
