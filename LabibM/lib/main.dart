import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labeeb_app/MainSectionPage.dart';
import 'package:labeeb_app/Words/AllWordlessons.dart';
import 'PlacementQuiz/testPage.dart';
import 'package:labeeb_app/Letters/AllLetterlessons.dart';
import 'package:labeeb_app/Letters/Letterslesson.dart';
import 'package:labeeb_app/Numbers/Numberlesson.dart';
import 'package:labeeb_app/Numbers/AllNumberlessons.dart';
import 'DataBase/database_service.dart';

void main() {
  runApp(StartApp());
}

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: StartPage(),
            routes: {
              '/GeneratedRWidget': (context) => Letterslesson('R'),
              '/GeneratedAinWidget': (context) => Letterslesson('Ain'),
              '/GeneratedTtaWidget': (context) => Letterslesson('Tta'),
              '/GeneratedTaWidget': (context) => Letterslesson('Ta'),
              '/GeneratedDaWidget': (context) => Letterslesson('Da'),
              '/GeneratedSsWidget': (context) => Letterslesson('Ss'),
              '/GeneratedShWidget': (context) => Letterslesson('Sh'),
              '/GeneratedSWidget': (context) => Letterslesson('S'),
              '/GeneratedZWidget': (context) => Letterslesson('Z'),
              '/GeneratedThaWidget': (context) => Letterslesson('Tha'),
              '/GeneratedDWidget': (context) => Letterslesson('D'),
              '/GeneratedKhWidget': (context) => Letterslesson('Kh'),
              '/GeneratedHaWidget': (context) => Letterslesson('Ha'),
              '/GeneratedAWidget': (context) => Letterslesson('A'),
              '/GeneratedBWidget': (context) => Letterslesson('B'),
              '/GeneratedTWidget': (context) => Letterslesson('T'),
              '/GeneratedThWidget': (context) => Letterslesson('Th'),
              '/GeneratedGWidget': (context) => Letterslesson('G'),
              '/GeneratedAin2Widget': (context) => Letterslesson('Ain2'),
              '/GeneratedWWidget': (context) => Letterslesson('W'),
              '/GeneratedYWidget': (context) => Letterslesson('Y'),
              '/GeneratedHWidget': (context) => Letterslesson('H'),
              '/GeneratedNWidget': (context) => Letterslesson('N'),
              '/GeneratedMWidget': (context) => Letterslesson('M'),
              '/GeneratedLamWidget': (context) => Letterslesson('Lam'),
              '/GeneratedKWidget': (context) => Letterslesson('K'),
              '/GeneratedKafWidget': (context) => Letterslesson('Kaf'),
              '/GeneratedFWidget': (context) => Letterslesson('F'),
              '/Generated0Widget': (context) => Numberlesson('0'),
              '/Generated1Widget': (context) => Numberlesson('1'),
              '/Generated2Widget': (context) => Numberlesson('2'),
              '/Generated3Widget': (context) => Numberlesson('3'),
              '/Generated4Widget': (context) => Numberlesson('4'),
              '/Generated5Widget': (context) => Numberlesson('5'),
              '/Generated6Widget': (context) => Numberlesson('6'),
              '/Generated7Widget': (context) => Numberlesson('7'),
              '/Generated8Widget': (context) => Numberlesson('8'),
              '/Generated9Widget': (context) => Numberlesson('9'),
              '/GeneratedLetterlessonsWidget': (context) => AllLetterlessons(),
              '/GeneratednumberLessonWidget': (context) => AllNumberlessons(),
              '/GeneratedMainSectionFromLetters': (context) =>
                  MainSectionPage('A'),
              '/GeneratedMainSectionFromNumbers': (context) =>
                  MainSectionPage('B'),
              '/GeneratedMainSectionFromWords': (context) =>
                  MainSectionPage('C'),
              '/GeneratedA': (context) => AllLetterlessons(),
              '/GeneratedB': (context) => AllNumberlessons(),
              '/GeneratedC': (context) => AllWordlessons(),
            },
          );
        });
  }
}

class StartPage extends StatelessWidget {
  final DatabaseService _databaseService = DatabaseService();

  StartPage() {
    callDB();
  }
  Future<void> callDB() async {
    await _databaseService.database;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/PlacementQuiz/background_fi.png"),
                fit: BoxFit.fill)),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround, //button position
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("",
                style: TextStyle(
                    height: 30, color: Color.fromARGB(255, 255, 255, 255))),
            // Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestPage()));
              },
              child: Text(
                " بدء اختبار تحديد المستوى",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 36, 68, 95),
                fixedSize: const Size(200, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
