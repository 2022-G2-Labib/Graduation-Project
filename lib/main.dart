import 'package:labib/MainPages/HomePage.dart';
import 'package:labib/MainPages/WordMainSectionPage.dart';
import 'package:labib/PlacementQuiz/PlacementTestPage.dart';
import 'package:labib/PlacementQuiz/result.dart';
import 'package:labib/account/WelcomePage.dart';
import 'package:labib/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:labib/DataBase/DatabaseService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Ai/pages/StartScreen.dart';
import 'Ai/services/service_locator.dart';
import 'Words/WordsTest.dart';
import 'Numbers/NumberTest.dart';
import 'Letters/lettersTest.dart';
import 'package:labib/Letters/AllLetterlessons.dart';
import 'package:labib/Numbers/AllNumberlessons.dart';
import 'package:labib/Ai/pages/instructions1.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final DatabaseService databaseService = DatabaseService();


  var status = prefs.getBool('isLoggedIn') ?? false;
  var status2 = prefs.getBool('placement') ?? false;
  print(status2);
  late String score;
  if (status) {
    int queryRows = await databaseService.getPlacmentTest();
    print(queryRows);
    score = queryRows <= 9 ? "مبتدئ" : "متقدم";
    Result(queryRows);
  }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: status == false
        ? const WelcomePage()
        : (status2 == true ? HomePage(score: score) : PlacementTestPage()),
    routes: {
      '/GeneratedA': (context) => AllLetterlessons(),
      '/GeneratedB': (context) => AllNumberlessons(),
      '/GeneratedC': (context) => WordMainSectionPage(),
      '/GeneratedATest': (context) => lettersTest('A'),
      '/GeneratedBTest': (context) => NumberTest(),
      '/GeneratedCTest': (context) => const WordsTest(),
      '/GeneratedA1AI': (context) => instructions1(
            page: 'A',
            level: '1',
          ),
      '/GeneratedA2AI': (context) => instructions1(
            page: 'A',
            level: '2',
          ),
      '/GeneratedB1AI': (context) => instructions1(
            page: 'B',
            level: '1',
          ),
      '/GeneratedB2AI': (context) => instructions1(
            page: 'B',
            level: '2',
          ),
      
    },
  ));
}

