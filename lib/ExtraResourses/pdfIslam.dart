// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable, camel_case_types, unused_import, file_names

import 'dart:io';
import 'package:flutter/material.dart';
import '../MainPages/HomePage.dart';
import '../PlacementQuiz/result.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class pdfIslam extends StatelessWidget {
  final String score;

  pdfIslam({Key? key, required this.score}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SfPdfViewer.asset('assets/pdfs/islamSign.pdf'),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 152, 193, 224).withOpacity(1),
      ),
    );
  }
}
