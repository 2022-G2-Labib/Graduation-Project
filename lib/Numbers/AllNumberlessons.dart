// ignore_for_file: prefer_const_literals_to_create_immutables, file_names, use_key_in_widget_constructors, must_be_immutable, prefer_is_not_empty, prefer_final_fields
import '../MainPages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:labib/PlacementQuiz/result.dart';
import 'package:labib/Numbers/Numberlesson.dart';
import 'package:labib/DataBase/DatabaseService.dart';
import 'package:labib/MainPages/MainSectionPage.dart';

class AllNumberlessons extends StatefulWidget {
  @override
  State<AllNumberlessons> createState() => _AllNumberlessonsState();
}

class _AllNumberlessonsState extends State<AllNumberlessons> {
  final DatabaseService _databaseService = DatabaseService();

  late Map<String, dynamic> donelist;

  Future<bool> initAsync() async {
    Map<String, dynamic> queryRows = await _databaseService.lessons('numbers');
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
                  //number lesson title
                  left: MediaQuery.of(context).size.width * 0.265,
                  top: (MediaQuery.of(context).size.width * 1.78) * 0.108,
                  right: null,
                  bottom: null,
                  child: Image.asset(
                    "assets/images/numberLesson.png",
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
                              builder: (context) => MainSectionPage('B'),
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
                    } else {
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
                                      builder: (context) => Numberlesson(0),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/0small${donelist['0']}.png'),
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
                                      builder: (context) => Numberlesson(1),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/1small${donelist['1']}.png'),
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
                                      builder: (context) => Numberlesson(2),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/2small${donelist['2']}.png'),
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
                                      builder: (context) => Numberlesson(3),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/3small${donelist['3']}.png'),
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
                                      builder: (context) => Numberlesson(4),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/4small${donelist['4']}.png'),
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
                                      builder: (context) => Numberlesson(5),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/5small${donelist['5']}.png'),
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
                                      builder: (context) => Numberlesson(6),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/6small${donelist['6']}.png'),
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
                                      builder: (context) => Numberlesson(7),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/7small${donelist['7']}.png'),
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
                                      builder: (context) => Numberlesson(8),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/8small${donelist['8']}.png'),
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
                                      builder: (context) => Numberlesson(9),
                                    ));
                              },
                              child: Image.asset(
                                  'assets/images/9small${donelist['9']}.png'),
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
