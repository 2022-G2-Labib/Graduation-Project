// ignore_for_file: unnecessary_const, file_names, must_be_immutable, use_key_in_widget_constructors, prefer_is_not_empty, prefer_final_fields, prefer_const_literals_to_create_immutables, avoid_print
import '../MainPages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:labib/PlacementQuiz/result.dart';
import 'package:labib/Letters/Letterslesson.dart';
import 'package:labib/DataBase/DatabaseService.dart';
import 'package:labib/MainPages/MainSectionPage.dart';

class AllLetterlessons extends StatefulWidget {
  @override
  State<AllLetterlessons> createState() => _AllLetterlessonsState();
}

class _AllLetterlessonsState extends State<AllLetterlessons> {
  final DatabaseService _databaseService = DatabaseService();

  late Map<String, dynamic> donelist;

  Future<bool> initAsync() async {
    Map<String, dynamic> queryRows = await _databaseService.lessons('letters');
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
            height: MediaQuery.of(context).size.width * 3.7,
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                  //blue background
                  left: 0.0,
                  top: 0.0,
                  right: null,
                  bottom: null,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/blueBackground2.png",
                  )),
              Positioned(
                  //letter lesson title
                  left: MediaQuery.of(context).size.width * 0.259,
                  top: (MediaQuery.of(context).size.width * 3.7) * 0.028,
                  right: null,
                  bottom: null,
                  child: Image.asset(
                    "assets/images/letterLesson.png",
                    width: MediaQuery.of(context).size.width * 0.482,
                    height: (MediaQuery.of(context).size.width*3.7) * 0.0422,
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
                    } else {
                      return Positioned(
                        child: Stack(children: [
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.022,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.082,
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
                              child: Image.asset(
                                  'assets/images/Asmall${donelist['A']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.354,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.082,
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
                              child: Image.asset(
                                  'assets/images/Bsmall${donelist['B']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.685,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.082,
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
                              child: Image.asset(
                                  'assets/images/Tsmall${donelist['T']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.022,
                            top: (MediaQuery.of(context).size.width * 3.7) *
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
                                      builder: (context) => Letterslesson('Th'),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/Thsmall${donelist['Th']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.354,
                            top: (MediaQuery.of(context).size.width * 3.7) *
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
                                      builder: (context) => Letterslesson('G'),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/Gsmall${donelist['G']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.685,
                            top: (MediaQuery.of(context).size.width * 3.7) *
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
                                      builder: (context) => Letterslesson('Ha'),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/Hasmall${donelist['Ha']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.685,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.258,
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
                                          Letterslesson('Tha'),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/Thasmall${donelist['Tha']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.022,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.258,
                            right: null,
                            bottom: null,
                            width: MediaQuery.of(context).size.width * 0.29,
                            height: MediaQuery.of(context).size.width * 0.29,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Letterslesson('Kh'),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/Khsmall${donelist['Kh']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.354,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.258,
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
                              child: Image.asset(
                                  'assets/images/Dsmall${donelist['D']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.022,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.346,
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
                              child: Image.asset(
                                  'assets/images/Rsmall${donelist['R']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.353,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.346,
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
                              child: Image.asset(
                                  'assets/images/Zsmall${donelist['Z']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.685,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.346,
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
                              child: Image.asset(
                                  'assets/images/Ssmall${donelist['S']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.014,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.434,
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
                              child: Image.asset(
                                  'assets/images/Shsmall${donelist['Sh']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.345,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.434,
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
                              child: Image.asset(
                                  'assets/images/Sssmall${donelist['Ss']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.677,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.433,
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
                              child: Image.asset(
                                  'assets/images/Dasmall${donelist['Da']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.014,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.522,
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
                              child: Image.asset(
                                  'assets/images/Tasmall${donelist['Ta']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.345,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.522,
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
                                          Letterslesson('Tta'),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/Ttasmall${donelist['Tta']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.677,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.522,
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
                                          Letterslesson('Ain'),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/Ainsmall${donelist['Ain']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.014,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.610,
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
                                          Letterslesson('Ain2'),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/Ain2small${donelist['Ain2']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.677,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.610,
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
                                          Letterslesson('Kaf'),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/Kafsmall${donelist['Kaf']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.345,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.610,
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
                              child: Image.asset(
                                  'assets/images/Fsmall${donelist['F']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.014,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.699,
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
                              child: Image.asset(
                                  'assets/images/Ksmall${donelist['K']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.345,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.699,
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
                                          Letterslesson('Lam'),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/Lamsmall${donelist['Lam']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.677,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.699,
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
                              child: Image.asset(
                                  'assets/images/Msmall${donelist['M']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.022,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.786,
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
                              child: Image.asset(
                                  'assets/images/Nsmall${donelist['N']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.354,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.786,
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
                              child: Image.asset(
                                  'assets/images/Hsmall${donelist['H']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.685,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.786,
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
                              child: Image.asset(
                                  'assets/images/Wsmall${donelist['W']}.png'),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.022,
                            top: (MediaQuery.of(context).size.width * 3.7) *
                                0.880,
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
                              child: Image.asset(
                                  'assets/images/Ysmall${donelist['Y']}.png'),
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
