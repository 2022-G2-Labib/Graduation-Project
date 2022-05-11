// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures, file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_is_not_empty, dead_code, non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:labeeb_app/DataBase/database_service.dart';
import 'package:labeeb_app/Numbers/AllNumberlessons.dart';

class Numberlesson extends StatefulWidget {
  int widgtNumber;
  Numberlesson(this.widgtNumber);

  @override
  State<StatefulWidget> createState() {
    return _NumberlessonState();
  }
}

class _NumberlessonState extends State<Numberlesson> {
  final DatabaseService _databaseService = DatabaseService();
  late String done;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> initAsync() async {
    String d =
        await _databaseService.retrieveDone(widget.widgtNumber.toString());
    done = d.toString();
    if (!done.isEmpty) return true;

    return false;
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<bool>(
        future: initAsync(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          return Scaffold(
            key: _scaffoldKey,
            body: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 1.78,
                  child: Stack(children: [
                    Positioned(
                        //blue background
                        left: 0.0,
                        top: 0.0,
                        right: null,
                        bottom: null,
                        child: Image.asset(
                          "assets/images/lessonBackground.png",
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * 1.78,
                        )),
                    Positioned(
                        //number lesson title
                        left: MediaQuery.of(context).size.width * 0.123,
                        top: (MediaQuery.of(context).size.width * 1.78) * 0.138,
                        right: null,
                        bottom: null,
                        child: Image.asset(
                          "assets/images/numberLesson.png",
                          width: MediaQuery.of(context).size.width * 0.398,
                          height: (MediaQuery.of(context).size.width * 1.78) *
                              0.048,
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
                                    builder: (context) => AllNumberlessons(),
                                  ));
                            },
                            child: Image.asset(
                              "assets/images/back.png",
                              width: MediaQuery.of(context).size.width * 0.039,
                              height:
                                  (MediaQuery.of(context).size.width * 1.78) *
                                      0.026,
                            ))),
                    Positioned(
                      //footer
                      left: MediaQuery.of(context).size.width * 0.142,
                      top: (MediaQuery.of(context).size.width * 1.78) * 0.830,
                      right: null,
                      bottom: null,
                      width: MediaQuery.of(context).size.width * 0.719,
                      height:
                          (MediaQuery.of(context).size.width * 1.78) * 0.147,
                      child: Stack(children: [
                        Positioned(
                          //next
                          left: MediaQuery.of(context).size.width * 0.607,
                          top: 0.0,
                          right: null,
                          bottom: null,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.widgtNumber == 9) {
                                widget.widgtNumber = 0;
                                setState(() {});
                              } else {
                                widget.widgtNumber = (widget.widgtNumber + 1);
                                setState(() {});
                              }
                            },
                            child: Image.asset(
                              "assets/images/Next.png",
                              width: MediaQuery.of(context).size.width * 0.111,
                              height: MediaQuery.of(context).size.width * 0.111,
                            ),
                          ),
                        ),
                        Positioned(
                          //check
                          left: MediaQuery.of(context).size.width * 0.304,
                          top: 0.0,
                          right: null,
                          bottom: null,
                          child: GestureDetector(
                            onTap: () async {
                              await _databaseService
                                  .updateDone(widget.widgtNumber.toString());
                              setState(() {});
                            },
                            child: Image.asset(
                              "assets/images/Check" + done + ".png",
                              width: MediaQuery.of(context).size.width * 0.111,
                              height: MediaQuery.of(context).size.width * 0.111,
                            ),
                          ),
                        ),
                        Positioned(
                          //previous
                          left: 0.0,
                          top: 0.0,
                          right: null,
                          bottom: null,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.widgtNumber == 0) {
                                print(widget.widgtNumber);
                                widget.widgtNumber = 9;
                                setState(() {});
                              } else {
                                widget.widgtNumber = (widget.widgtNumber - 1);
                                setState(() {});
                              }
                            },
                            child: Image.asset(
                              "assets/images/Previous.png",
                              width: MediaQuery.of(context).size.width * 0.111,
                              height: MediaQuery.of(context).size.width * 0.111,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.136,
                      top: (MediaQuery.of(context).size.width * 1.78) * 0.336,
                      right: null,
                      bottom: null,
                      width: MediaQuery.of(context).size.width * 0.735,
                      height:
                          (MediaQuery.of(context).size.width * 1.78) * 0.428,
                      child: Image.asset('assets/images/' +
                          widget.widgtNumber.toString() +
                          'l.png'),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.189,
                      top: (MediaQuery.of(context).size.width * 1.78) * 0.3609,
                      right: null,
                      bottom: null,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllNumberlessons(),
                              ));
                        },
                        child: Image.asset(
                          'assets/images/x.png',
                          width: MediaQuery.of(context).size.width * 0.019,
                          height: (MediaQuery.of(context).size.width * 1.78) *
                              0.014,
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.042,
                      top: (MediaQuery.of(context).size.width * 1.78) * 0.017,
                      right: null,
                      bottom: null,
                      width: MediaQuery.of(context).size.width * 0.111,
                      height: MediaQuery.of(context).size.width * 0.111,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllNumberlessons(),
                              ));
                        },
                        child: const Text("   "),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
