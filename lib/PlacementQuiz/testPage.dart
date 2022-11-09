// ignore_for_file: unnecessary_const, file_names, unnecessary_import, use_key_in_widget_constructors, use_build_context_synchronously, library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:labib/DataBase/DatabaseService.dart';
import 'questions.dart';
import 'result.dart';
import 'widgets.dart';
import 'questionController.dart';
import 'PlacementTestModel.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final DatabaseService _databaseService = DatabaseService();
  int currentLevel = 1;
  int points = 0;
  late PlacementTestModel currentQuestion;
  late List<String> answers;
  late List<int> questionIndex;
  late List<bool?> answerValidation = [null, null, null, null];

  @override
  void initState() {
    super.initState();
    questionIndex = getRandomQuestionIndex(10);
    loadNewQuestion();
  }

  loadNewQuestion() {
    setState(() {
      currentQuestion = loadQuestion(questionIndex[currentLevel - 1]);
      answers = getRandomQuestionList(
          currentQuestion.wrongAnswers, currentQuestion.correctAnswer);
      answerValidation = [null, null, null, null];
    });
  }

  validateAndShowQuestion(int userAnswerIndex) async {
    setState(() {
      int correctIndex =
          getCorrectAnswerIndex(answers, currentQuestion.correctAnswer);
      answerValidation[correctIndex] = true;
      if (userAnswerIndex == correctIndex) {
        points++;
      } else {
        answerValidation[userAnswerIndex] = false;
      }
    });

    await Future.delayed(const Duration(seconds: 1));

    currentLevel++;
    if (currentLevel <= 10) {
      loadNewQuestion();
    } else {
      update(points);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Result(points)));
    }
  }

  Future<void> update(int testResult) async {
    await _databaseService.updateTestResult('placementTest',testResult,'GameGrade');
    Result(testResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: const AssetImage(
                    "assets/PlacementQuiz/test_background.png"),
                fit: BoxFit.fill)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/PlacementQuiz/' + currentQuestion.image,
                  height: 270,
                  width: 270,
                ),
                Text(
                  currentQuestion.question,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 21, 23, 54),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  child: answerCard(answers[0], context,
                      answer: answerValidation[0]),
                  onTap: () {
                    validateAndShowQuestion(0);
                  },
                ),
                InkWell(
                  child: answerCard(answers[1], context,
                      answer: answerValidation[1]),
                  onTap: () {
                    validateAndShowQuestion(1);
                  },
                ),
                InkWell(
                  child: answerCard(answers[2], context,
                      answer: answerValidation[2]),
                  onTap: () {
                    validateAndShowQuestion(2);
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
