// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:labib/Ai/pages/instructions2.dart';
import 'package:labib/Ai/pages/lettersAi.dart';
import 'package:labib/Ai/pages/lettersAi2.dart';
import 'package:labib/Ai/pages/numbersAi.dart';
import 'package:labib/Ai/pages/numbersAi2.dart';
import 'package:labib/MainPages/QuizSectionPage.dart';
import '../services/model_inference_service.dart';
import '../services/service_locator.dart';

class instructions1 extends StatefulWidget {
  instructions1({
    required this.page,
    required this.level,
  });
  final String level;
  final String page;
  @override
  State<instructions1> createState() => _StartScreenState();
}

class _StartScreenState extends State<instructions1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/ai/instructions2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
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
                          builder: (context) => QuizSectionPage(widget.page),
                        ));
                  },
                  child: Image.asset(
                    "assets/images/back.png",
                    width: MediaQuery.of(context).size.width * 0.039,
                    height: (MediaQuery.of(context).size.width * 1.78) * 0.026,
                  ))),
          Positioned(
              //Strat quiz button
              left: width * 0.2451,
              top: height * 0.7515,
              right: null,
              bottom: null,
              child: GestureDetector(
                  onTap: () {
                    locator<ModelInferenceService>()
                        .setModelConfig(widget.page);
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => instructions2(
                                      page: widget.page,
                                      level: widget.level,
                                    )));
                  },
                  child: Image.asset(
                    "assets/ai/nextt.png",
                    width: width * 0.5097,
                    height: height * 0.0828,
                  ))),
        ]),
      ),
    );
  }
}

