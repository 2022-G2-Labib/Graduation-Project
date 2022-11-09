// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_is_empty, annotate_overrides, deprecated_member_use, prefer_const_constructors, avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:labib/MainPages/HomePage.dart';
import 'package:labib/Letters/LetterstestModel.dart';
import 'package:labib/PlacementQuiz/result.dart';
import 'package:labib/DataBase/DatabaseService.dart';

class lettersTest extends StatefulWidget {
  lettersTest(String s);

  @override
  _lettersTestState createState() => _lettersTestState();
}

class _lettersTestState extends State<lettersTest> {
  late List<LettersTestModel> items;
  late List<LettersTestModel> items2;
  late int score;
  late bool testEnd;
  late int counter;
  final DatabaseService _databaseService = DatabaseService();

  initTest() {
    testEnd = false;
    score = 0;
    counter = 3;
    items = [
      LettersTestModel(name: 'أ', value: 'أ', img: 'assets/letters/A.png'),
      LettersTestModel(name: 'ب', value: 'ب', img: 'assets/letters/B.png'),
      LettersTestModel(name: 'ت', value: 'ت', img: 'assets/letters/T.png'),
      LettersTestModel(name: 'ث', value: 'ث', img: 'assets/letters/TH.png'),
      LettersTestModel(name: 'ج', value: 'ج', img: 'assets/letters/J.png'),
      LettersTestModel(name: 'ح', value: 'ح', img: 'assets/letters/H.png'),
      LettersTestModel(name: 'خ', value: 'خ', img: 'assets/letters/KH.png'),
    ];
    items2 = [
      LettersTestModel(name: 'أ', value: 'أ', img: 'assets/letters/A.png'),
      LettersTestModel(name: 'ب', value: 'ب', img: 'assets/letters/B.png'),
      LettersTestModel(name: 'ت', value: 'ت', img: 'assets/letters/T.png'),
      LettersTestModel(name: 'ث', value: 'ث', img: 'assets/letters/TH.png'),
      LettersTestModel(name: 'ج', value: 'ج', img: 'assets/letters/J.png'),
      LettersTestModel(name: 'ح', value: 'ح', img: 'assets/letters/H.png'),
      LettersTestModel(name: 'خ', value: 'خ', img: 'assets/letters/KH.png'),
    ];
    items.shuffle();
    items2.shuffle();
  }

  void initState() {
    super.initState();
    initTest();
  }

  Future<void> update(int testResult) async {
    await _databaseService.updateTestResult('lettersTest', testResult,'GameGrade');
  }

  @override
  Widget build(BuildContext context) {
    if (items.length == 0 || counter == 0) {
      testEnd = true;
    }

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/PlacementQuiz/test_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: testEnd && score <= 7
            ? score == 7
                ? AlertDialog(
                    alignment: Alignment.center,
                    backgroundColor: const Color.fromARGB(221, 237, 238, 237),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: Center(
                      child: Text(
                        "احسنت! لقد اجتزت الاختبار \n حصلت على نتيجة $score/7",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 36, 68, 95),
                        ),
                      ),
                    ),
                    content: Image.asset(
                      'assets/Happy.PNG',
                      height: 150,
                      width: 150,
                    ),
                    actions: [
                      SizedBox(
                        width: 140,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 36, 68, 95),
                          ),
                          onPressed: () {
                            update(score);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                          score: Result.score,
                                        )));
                          },
                          label: Text(
                            " إغلاق ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 68, 95)),
                          ),
                        ),
                      ),
                    ],
                  )
                : AlertDialog(
                    alignment: Alignment.center,
                    backgroundColor: const Color.fromARGB(221, 237, 238, 237),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: Center(
                      child: Text(
                        "!انتهت عدد المحاولات \n حصلت على نتيجة $score/7",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 36, 68, 95),
                        ),
                      ),
                    ),
                    content: Image.asset(
                      'assets/Sad.PNG',
                      height: 150,
                      width: 150,
                    ),
                    actions: [
                      SizedBox(
                        width: 140,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 36, 68, 95),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                          score: Result.score,
                                        )));
                          },
                          label: Text(
                            " إغلاق ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 68, 95)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 140,
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.refresh,
                            color: Color.fromARGB(255, 36, 68, 95),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => lettersTest('A'),
                              ),
                            );
                            //);
                          },
                          label: const Text(
                            "اعد المحاولة",
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 68, 95)),
                          ),
                        ),
                      ),
                    ],
                  ) //

            : SingleChildScrollView(
                child: Stack(
                  children: [
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
                                      backgroundColor: const Color.fromARGB(
                                          221, 237, 238, 237),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      title: Center(
                                          child: Text(
                                        "هل تود الخروج من الاختبار؟",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.056,
                                            color: const Color.fromARGB(
                                                255, 36, 68, 95)),
                                      )),
                                      actions: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.31,
                                          child: ElevatedButton.icon(
                                            icon: const Icon(
                                              Icons.check,
                                              color: Color.fromARGB(
                                                  255, 36, 68, 95),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomePage(
                                                            score: Result.score,
                                                          )));
                                            },
                                            label: const Text(
                                              " نعم ",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 36, 68, 95)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.31,
                                          child: ElevatedButton.icon(
                                            icon: const Icon(
                                              Icons.close,
                                              color: Color.fromARGB(
                                                  255, 36, 68, 95),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            label: const Text(
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
                              height:
                                  (MediaQuery.of(context).size.width * 1.78) *
                                      0.026,
                            ))),
                    Column(
                      children: [
                        if (counter != 0 && score < 7)
                          Text(
                            'عدد المحاولات المتبقية: $counter',
                            style: const TextStyle(
                              fontSize: 20,
                              height: 5,
                              color: Color.fromARGB(255, 36, 68, 95),
                            ),
                          ),
                        if (counter != 0 && score < 7)
                          const Text(
                            'قم بسحب كل صورة للحرف المناسب \n',
                            style: TextStyle(
                              fontSize: 18,
                              height: 0.5,
                              color: Color.fromARGB(255, 36, 68, 95),
                            ),
                          ),
                        if (!testEnd)
                          Row(
                            children: [
                              const Spacer(),
                              Column(
                                children: items.map((item) {
                                  return Container(
                                    margin: const EdgeInsets.all(8),
                                    child: Draggable<LettersTestModel>(
                                      data: item,
                                      childWhenDragging: CircleAvatar(
                                        backgroundColor: const Color.fromARGB(
                                            151, 238, 238, 238),
                                        backgroundImage: AssetImage(item.img),
                                        radius: 40,
                                      ),
                                      feedback: CircleAvatar(
                                        backgroundColor: const Color.fromARGB(
                                            151, 238, 238, 238),
                                        backgroundImage: AssetImage(item.img),
                                        radius: 30,
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: const Color.fromARGB(
                                            151, 238, 238, 238),
                                        backgroundImage: AssetImage(item.img),
                                        radius: 42,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              const Spacer(flex: 2),
                              Column(
                                children: items2.map((item) {
                                  return DragTarget<LettersTestModel>(
                                    onAccept: (receivedItem) {
                                      if (item.value == receivedItem.value) {
                                        setState(() {
                                          items.remove(receivedItem);
                                          items2.remove(item);
                                        });
                                        score += 1;
                                        item.accepting = false;
                                      } else {
                                        setState(() {
                                          counter -= 1;
                                          item.accepting = false;
                                        });
                                      }
                                      print(score);
                                    },
                                    onWillAccept: (receivedItem) {
                                      setState(() {
                                        item.accepting = true;
                                      });
                                      return true;
                                    },
                                    onLeave: (receivedItem) {
                                      setState(() {
                                        item.accepting = false;
                                      });
                                    },
                                    builder: (context, acceptedItems,
                                            rejectedItems) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(150),
                                        color: item.accepting
                                            ? const Color.fromARGB(
                                                181, 224, 224, 224)
                                            : const Color.fromARGB(
                                                151, 238, 238, 238),
                                      ),
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              4.9,
                                      width: MediaQuery.of(context).size.width /
                                          4.7,
                                      margin: const EdgeInsets.all(8),
                                      child: Text(
                                        item.name,
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 36, 68, 95),
                                          fontSize: 23,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              const Spacer(),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
