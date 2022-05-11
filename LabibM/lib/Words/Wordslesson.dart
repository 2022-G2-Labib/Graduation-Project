// ignore_for_file: avoid_print, file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_is_not_empty, prefer_final_fields, prefer_const_literals_to_create_immutables, non_constant_identifier_names, dead_code, must_be_immutable

import 'package:flutter/material.dart';
import 'package:labeeb_app/DataBase/database_service.dart';
import 'package:labeeb_app/Words/AllWordlessons.dart';

class Wordslesson extends StatefulWidget {
  String widgtWord;
  Wordslesson(this.widgtWord);

  @override
  State<StatefulWidget> createState() {
    return _WordslessonState();
  }
}

class _WordslessonState extends State<Wordslesson> {
  final DatabaseService _databaseService = DatabaseService();
  late String done;
  List<String> words = [
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
  List<String> wordsText = [
    'السلام عليكم',
    'شكراً',
    'يمين',
    'يسار',
    'أمام',
    'تحت',
    'طويل',
    'قصير',
    'ينام',
    'يشرب',
    'يأكل'
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<bool> initAsync() async {
    String d = await _databaseService.retrieveDone(widget.widgtWord);
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
            endDrawer: SizedBox(
              width: 250,
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(
                      height: 250.0,
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(153, 192, 219, 241)),
                        child: Image(
                          image: AssetImage('assets/Reading.PNG'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const ListTile(
                      title: Text(
                        "مصادر اضافية",
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const ListTile(
                      title: Text(
                        "تواصل معنا",
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              ),
            ),
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
                          "assets/words/Wordslesson.png",
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
                                    builder: (context) => AllWordlessons(),
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
                              if (widget.widgtWord == '160') {
                                widget.widgtWord = '290';
                                setState(() {});
                              } else {
                                widget.widgtWord = words.elementAt(
                                    words.indexOf(widget.widgtWord) + 1);
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
                                  .updateDone(widget.widgtWord);

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
                              if (widget.widgtWord == '290') {
                                widget.widgtWord = '160';
                                setState(() {});
                              } else {
                                widget.widgtWord = words.elementAt(
                                    words.indexOf(widget.widgtWord) - 1);
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
                      child: Image.asset(
                        'assets/words/w1/' +
                            (words.indexOf(widget.widgtWord) + 1).toString() +
                            '-11.png',
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.2256,
                      top: (MediaQuery.of(context).size.width * 1.78) * 0.3890,
                      right: null,
                      bottom: null,
                      width: MediaQuery.of(context).size.width * 0.5515,
                      height:
                          (MediaQuery.of(context).size.width * 1.78) * 0.28125,
                      child: Image.asset(
                          'assets/words/w1/' + widget.widgtWord + '.gif'),
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
                                builder: (context) => AllWordlessons(),
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
                                builder: (context) => AllWordlessons(),
                              ));
                        },
                        child: const Text("   "),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
