// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget wordsGameLetters(String character, bool hidden) {
  return Container(
    height: 55,
    width: 50,
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: Color.fromARGB(62, 146, 146, 148),
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Visibility(
      visible: !hidden,
      child: Text(
        character,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(195, 4, 32, 146),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
