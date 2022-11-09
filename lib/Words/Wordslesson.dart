// ignore_for_file: avoid_print, file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_is_not_empty, prefer_final_fields, prefer_const_literals_to_create_immutables, non_constant_identifier_names, dead_code, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:labib/Words/AllWordlessons.dart';
import 'package:labib/DataBase/DatabaseService.dart';

class Wordslesson extends StatefulWidget {
  String widgtWord;
  late String Section;
  Wordslesson(this.widgtWord, this.Section);

  @override
  State<StatefulWidget> createState() {
    return _WordslessonState();
  }
}

class _WordslessonState extends State<Wordslesson> {
  final DatabaseService _databaseService = DatabaseService();
  late String done;
  List<String> wordsA = [
    '290',
    '293',
    '288',
    '287',
    '273',
    '277',
    '226',
    '227',
    '162',
    '161',
    '160'
  ];
  List<String> wordsB = [
    '92',
    '93',
    '94',
    '95',
    '98',
    '100',
    '116',
    '117',
    '121'
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<bool> initAsync() async {
    String d = await _databaseService.retrieveDone('words', widget.widgtWord);
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
              top: (height) * 0.138,
              right: null,
              bottom: null,
              child: Image.asset(
                "assets/words/Wordslesson.png",
                width: width * 0.398,
                height: (height) * 0.048,
              )),
          Positioned(
              //back
              left: width * 0.056,
              top: (height) * 0.055,
              right: null,
              bottom: null,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllWordlessons(widget.Section),
                        ));
                  },
                  child: Image.asset(
                    "assets/images/back.png",
                    width: width * 0.039,
                    height: (height) * 0.026,
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
                    top: (height) * 0.830,
                    right: null,
                    bottom: null,
                    width: width * 0.719,
                    height: (height) * 0.147,
                    child: Stack(children: [
                      Positioned(
                        //next
                        left: width * 0.607,
                        top: 0.0,
                        right: null,
                        bottom: null,
                        child: GestureDetector(
                          onTap: () {
                            if (widget.widgtWord == '160' ||
                                widget.widgtWord == '121') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AllWordlessons(widget.Section),
                                  ));
                            } else {
                              if (widget.Section == 'A') {
                                widget.widgtWord = wordsA.elementAt(
                                    wordsA.indexOf(widget.widgtWord) + 1);
                                setState(() {});
                              } else {
                                widget.widgtWord = wordsB.elementAt(
                                    wordsB.indexOf(widget.widgtWord) + 1);
                                setState(() {});
                              }
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
                                'words', widget.widgtWord);

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
                            if (widget.widgtWord == '290' ||
                                widget.widgtWord == '92') {
                            } else {
                              if (widget.Section == 'A') {
                                widget.widgtWord = wordsA.elementAt(
                                    wordsA.indexOf(widget.widgtWord) - 1);
                                setState(() {});
                              } else {
                                widget.widgtWord = wordsB.elementAt(
                                    wordsB.indexOf(widget.widgtWord) - 1);
                                setState(() {});
                              }
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
                    top: (height) * 0.336,
                    right: null,
                    bottom: null,
                    width: width * 0.735,
                    height: (height) * 0.428,
                    child: Image.asset(
                      'assets/words/${widget.widgtWord}.png',
                    ),
                  ),
                  Positioned(
                    left: width * 0.2256,
                    top: (height) * 0.3890,
                    right: null,
                    bottom: null,
                    width: width * 0.5515,
                    height: (height) * 0.28125,
                    child: Image.asset('assets/words/${widget.widgtWord}.gif'),
                  ),
                  Positioned(
                    left: width * 0.189,
                    top: (height) * 0.3609,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AllWordlessons(widget.Section),
                            ));
                      },
                      child: Image.asset(
                        'assets/images/x.png',
                        width: width * 0.019,
                        height: (height) * 0.014,
                      ),
                    ),
                  ),
                  Positioned(
                    left: width * 0.042,
                    top: (height) * 0.017,
                    right: null,
                    bottom: null,
                    width: width * 0.111,
                    height: width * 0.111,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AllWordlessons(widget.Section),
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
