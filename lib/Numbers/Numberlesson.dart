// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures, file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_is_not_empty, dead_code, non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_final_fields, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:labib/Numbers/AllNumberlessons.dart';

import '../DataBase/DatabaseService.dart';

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
    String d = await _databaseService.retrieveDone(
        'numbers', widget.widgtNumber.toString());
    done = d.toString();
    if (!done.isEmpty) return true;

    return false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/lessonBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Positioned(
              //number lesson title
              left: width * 0.123,
              top: height * 0.138,
              right: null,
              bottom: null,
              child: Image.asset(
                "assets/images/numberLesson.png",
                width: width * 0.398,
                height: height * 0.048,
              )),
          Positioned(
              //back
              left: width * 0.056,
              top: height * 0.055,
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
                    width: width * 0.039,
                    height: height * 0.026,
                  ))),
          FutureBuilder<bool>(
              future: initAsync(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Stack(children: [
                  Positioned(
                    //footer
                    left: width * 0.142,
                    top: height * 0.830,
                    right: null,
                    bottom: null,
                    width: width * 0.719,
                    height: height * 0.147,
                    child: Stack(children: [
                      Positioned(
                        //next
                        left: width * 0.607,
                        top: 0.0,
                        right: null,
                        bottom: null,
                        child: GestureDetector(
                          onTap: () {
                            if (widget.widgtNumber == 9) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AllNumberlessons(),
                                  ));
                            } else {
                              widget.widgtNumber = (widget.widgtNumber + 1);
                              setState(() {});
                            }
                          },
                          child: Image.asset(
                            "assets/images/Next.png",
                            width: width * 0.111,
                            height: width * 0.111,
                          ),
                        ),
                      ),
                      Positioned(
                        //check
                        left: width * 0.304,
                        top: 0.0,
                        right: null,
                        bottom: null,
                        child: GestureDetector(
                          onTap: () async {
                            await _databaseService.updateDone(
                                'numbers', widget.widgtNumber.toString());
                            setState(() {});
                          },
                          child: Image.asset(
                            "assets/images/Check$done.png",
                            width: width * 0.111,
                            height: width * 0.111,
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
                            } else {
                              widget.widgtNumber = (widget.widgtNumber - 1);
                              setState(() {});
                            }
                          },
                          child: Image.asset(
                            "assets/images/Previous.png",
                            width: width * 0.111,
                            height: width * 0.111,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Positioned(
                    left: width * 0.136,
                    top: height * 0.336,
                    right: null,
                    bottom: null,
                    width: width * 0.735,
                    height: height * 0.428,
                    child:
                        Image.asset('assets/images/${widget.widgtNumber}l.png'),
                  ),
                  Positioned(
                    left: width * 0.189,
                    top: height * 0.3609,
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
                        width: width * 0.019,
                        height: height * 0.014,
                      ),
                    ),
                  ),
                  Positioned(
                    left: width * 0.042,
                    top: height * 0.017,
                    right: null,
                    bottom: null,
                    width: width * 0.111,
                    height: width * 0.111,
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
                ]);
              }),
        ]),
      ),
    );
  }
}
