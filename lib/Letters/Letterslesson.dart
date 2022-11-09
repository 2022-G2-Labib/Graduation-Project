// ignore_for_file: avoid_print, file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_is_not_empty, prefer_final_fields, prefer_const_literals_to_create_immutables, non_constant_identifier_names, dead_code, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:labib/Letters/AllLetterlessons.dart';
import 'package:labib/DataBase/DatabaseService.dart';

class Letterslesson extends StatefulWidget {
  String widgtName;
  Letterslesson(this.widgtName);

  @override
  State<StatefulWidget> createState() {
    return _LetterslessonState();
  }
}

class _LetterslessonState extends State<Letterslesson> {
  final DatabaseService _databaseService = DatabaseService();
  late String done;
  List<String> letter = [
    'A',
    'B',
    'T',
    'Th',
    'G',
    'Ha',
    'Kh',
    'D',
    'Tha',
    'R',
    'Z',
    'S',
    'Sh',
    'Ss',
    'Da',
    'Ta',
    'Tta',
    'Ain',
    'Ain2',
    'F',
    'Kaf',
    'K',
    'Lam',
    'M',
    'N',
    'H',
    'W',
    'Y'
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<bool> initAsync() async {
    String d = await _databaseService.retrieveDone('letters', widget.widgtName);
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
                "assets/images/letterLesson.png",
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
                          builder: (context) => AllLetterlessons(),
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
                            if (widget.widgtName == 'Y') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AllLetterlessons(),
                                  ));
                            } else {
                              widget.widgtName = letter.elementAt(
                                  letter.indexOf(widget.widgtName) + 1);
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
                                'letters', widget.widgtName);
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
                            if (widget.widgtName == 'A') {
                            } else {
                              widget.widgtName = letter.elementAt(
                                  letter.indexOf(widget.widgtName) - 1);
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
                    child: Image.asset('assets/images/${widget.widgtName}.png'),
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
                              builder: (context) => AllLetterlessons(),
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
                              builder: (context) => AllLetterlessons(),
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
