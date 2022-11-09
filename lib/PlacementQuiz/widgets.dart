// ignore_for_file: sized_box_for_whitespace, unnecessary_const

import 'package:flutter/material.dart';

//import 'package:flutter/material.dart';

Widget answerCard(String text, BuildContext context, {bool? answer}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.1,
    width: MediaQuery.of(context).size.width,
    child: Card(
      color: (answer == null)
          ? Colors.white
          : (answer)
              ? const Color.fromARGB(202, 106, 179, 108)
              : const Color.fromARGB(202, 219, 111, 104),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(const Radius.circular(20))),
      elevation: 3.5,
      // color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}
