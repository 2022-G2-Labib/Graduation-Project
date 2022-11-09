// ignore_for_file: prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, file_names, avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:labib/PlacementQuiz/result.dart';
import 'package:labib/DataBase/DatabaseService.dart';
import '../MainPages/HomePage.dart';
import 'wordsGame.dart';
import 'wordsGameLetters.dart';

class WordsTest extends StatefulWidget {
  const WordsTest({Key? key}) : super(key: key);

  @override
  State<WordsTest> createState() => _WordsTestState();
}

class _WordsTestState extends State<WordsTest> {
  final DatabaseService _databaseService = DatabaseService();

  List<String> word = [
    "يسار",
    "شكرا",
    "ياكل",
    "صيدلية",
    "الم",
    "يشرب",
    "قصير",
    "تحت",
    "حروق",
    "ينام"
  ];
  int qnum = 0;
  int correctLetter = 0;
  int currentQ = 0;
  List<String> alphabets = [
    "ا",
    "ب",
    "ت",
    "ث",
    "ج",
    "ح",
    "خ",
    "د",
    "ذ",
    "ر",
    "ز",
    "س",
    "ش",
    "ص",
    "ض",
    "ط",
    "ظ",
    "ع",
    "غ",
    "ف",
    "ق",
    "ك",
    "ل",
    "م",
    "ن",
    "ه",
    "و",
    "ي",
    "ة"
  ];
  Future<void> update(int testResult) async {
    await _databaseService.updateTestResult('wordsTest', testResult,'GameGrade');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 1.78,
              child: Stack(children: [
                Positioned(
                    //background
                    left: 0.0,
                    top: 0.0,
                    right: null,
                    bottom: null,
                    child: Image.asset(
                      "assets/PlacementQuiz/test_background.png",
                      width: MediaQuery.of(context).size.width,
                      height: (MediaQuery.of(context).size.width * 1.78),
                    )),

                Positioned(
                    //exit
                    left: MediaQuery.of(context).size.width * 0.056,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.055,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor:
                                      Color.fromARGB(221, 237, 238, 237),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  title: Center(
                                      child: Text(
                                    "هل تود الخروج من الاختبار؟",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.056,
                                        color: Color.fromARGB(255, 36, 68, 95)),
                                  )),
                                  actions: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.31,
                                      child: ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.check,
                                          color:
                                              Color.fromARGB(255, 36, 68, 95),
                                        ),
                                        onPressed: () {
                                          wordsGame.numOfTries = 3;
                                          wordsGame.selectedChar = [];
                                          qnum = 0;
                                          correctLetter = 0;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage(
                                                        score: Result.score,
                                                      )));
                                        },
                                        label: Text(
                                          " نعم ",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 36, 68, 95)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.31,
                                      child: ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.close,
                                          color:
                                              Color.fromARGB(255, 36, 68, 95),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        label: Text(
                                          " لا ",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 36, 68, 95)),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Image.asset(
                          "assets/exit.png",
                          width: MediaQuery.of(context).size.width * 0.039,
                          height: (MediaQuery.of(context).size.width * 1.78) *
                              0.026,
                        ))),

                Positioned(
                    //gif
                    left: MediaQuery.of(context).size.width * 0.19,
                    top: MediaQuery.of(context).size.width * -0.35,
                    child: Image.asset(
                      "assets/WordsGame/wordsQ$qnum.gif",
                      width: MediaQuery.of(context).size.width * 0.68,
                      height: (MediaQuery.of(context).size.width * 1.68),
                    )),
                Positioned(
                  //numOfTries
                  left: MediaQuery.of(context).size.width * 0.35,
                  top: MediaQuery.of(context).size.width * 0.9,

                  child: Text(
                    "عدد المحاولات المتبقية: ${wordsGame.numOfTries}",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 77, 128, 170)),
                  ),
                ),

                Positioned.fill(
                  //answer boxes
                  left: MediaQuery.of(context).size.width * 0.02,
                  top: MediaQuery.of(context).size.width * 0.4,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: word[qnum]
                        .split("")
                        .map(
                          (e) => wordsGameLetters(e.toUpperCase(),
                              !wordsGame.selectedChar.contains(e)),
                        )
                        .toList(),
                  ),
                ),

                //choices -letters- :
                Positioned.fill(
                  left: MediaQuery.of(context).size.width * 0.02,
                  top: MediaQuery.of(context).size.width * 1.15,
                  child: SizedBox(
                    width: double.infinity,
                    height: (MediaQuery.of(context).size.width * 1.78) * 0.3906,
                    child: GridView.count(
                      crossAxisCount: 8,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      padding: EdgeInsets.all(3),
                      children: alphabets.map((e) {
                        return RawMaterialButton(
                          onPressed: //game Logic
                              wordsGame.selectedChar.contains(e)
                                  ? null
                                  : () {
                                      setState(() {
                                        wordsGame.selectedChar.add(e);
                                        print(wordsGame.selectedChar);
                                        if (!word[qnum].split("").contains(e)) {
                                          wordsGame.numOfTries--;

                                          if (wordsGame.numOfTries == 0) {
                                            //معناها انه خسر
                                            currentQ = qnum;
                                            wordsGame.numOfTries = 3;
                                            wordsGame.selectedChar = [];
                                            qnum = 0;
                                            correctLetter = 0;
                                            //alert
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            221, 237, 238, 237),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    title: Center(
                                                        child: Text(
                                                      "!انتهت عدد المحاولات \n حصلت على نتيجة $currentQ/9",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Color.fromARGB(
                                                              255, 36, 68, 95)),
                                                    )),
                                                    content: Image.asset(
                                                      'assets/Sad.PNG',
                                                      height: 130,
                                                      width: 130,
                                                    ),
                                                    actions: [
                                                      Container(
                                                        width: 140,
                                                        child:
                                                            ElevatedButton.icon(
                                                          icon: Icon(
                                                            Icons.close,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    36,
                                                                    68,
                                                                    95),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            HomePage(
                                                                              score: Result.score,
                                                                            )));
                                                          },
                                                          label: Text(
                                                            "اغلاق",
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        36,
                                                                        68,
                                                                        95)),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 140,
                                                        child:
                                                            ElevatedButton.icon(
                                                          icon: Icon(
                                                            Icons.refresh,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    36,
                                                                    68,
                                                                    95),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          label: Text(
                                                            "اعد المحاولة",
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        36,
                                                                        68,
                                                                        95)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          }
                                        } //
                                        else {
                                          correctLetter++;
                                        }
                                        if ((qnum == 0 ||
                                                qnum == 1 ||
                                                qnum == 2 ||
                                                qnum == 5 ||
                                                qnum == 6 ||
                                                qnum == 8) &&
                                            correctLetter == 4) {
                                          //السؤال الاول وجاب كل الحروف صح
                                          qnum++; // to go to the next Q
                                          correctLetter = 0; //restart
                                          wordsGame.selectedChar =
                                              []; //عشان يروح التحديد
                                        }

                                        if (qnum == 3 && correctLetter == 5) {
                                          //السؤال الاول وجاب كل الحروف صح
                                          qnum++; // to go to the next Q
                                          correctLetter = 0; //restart
                                          wordsGame.selectedChar =
                                              []; //عشان يروح التحديد
                                        }
                                        if (qnum == 4 && correctLetter == 3) {
                                          qnum++; // to go to the next Q
                                          correctLetter = 0; //restart
                                          wordsGame.selectedChar =
                                              []; //عشان يروح التحديد
                                        }

                                        if (qnum == 7 && correctLetter == 2) {
                                          qnum++; // to go to the next Q
                                          correctLetter = 0; //restart
                                          wordsGame.selectedChar =
                                              []; //عشان يروح التحديد
                                        }
                                        if (qnum == 9 && correctLetter == 4) {
                                          update(qnum);
                                          wordsGame.numOfTries = 3;
                                          wordsGame.selectedChar = [];
                                          currentQ = qnum;
                                          qnum = 0;
                                          correctLetter = 0;
                                          // wordsTest= true;

                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          221, 237, 238, 237),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  title: Center(
                                                      child: Text(
                                                    "احسنت! لقد اجتزت الاختبار \n حصلت على نتيجة $currentQ/9",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Color.fromARGB(
                                                            255, 36, 68, 95)),
                                                  )),
                                                  content: Image.asset(
                                                    'assets/Happy.PNG',
                                                    height: 130,
                                                    width: 130,
                                                  ),
                                                  actions: [
                                                    Container(
                                                      width: 140,
                                                      child:
                                                          ElevatedButton.icon(
                                                        icon: Icon(
                                                          Icons.close,
                                                          color: Color.fromARGB(
                                                              255, 36, 68, 95),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          HomePage(
                                                                            score:
                                                                                Result.score,
                                                                          )));
                                                        },
                                                        label: Text(
                                                          "اغلاق",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      36,
                                                                      68,
                                                                      95)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              });

                                          //خلضت اللعبة وافاز
                                        }
                                      });
                                    },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            e,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          fillColor: wordsGame.selectedChar.contains(e)
                              ? Color.fromARGB(255, 48, 53, 89)
                              : Color.fromARGB(255, 113, 186, 254)
                                  .withOpacity(0.45),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ])) // كامل الشاشة
        ]),
        //
      ),
    );
  }
}
