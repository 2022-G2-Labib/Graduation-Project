// ignore_for_file: prefer_const_constructors, file_names, must_be_immutable, prefer_final_fields, prefer_const_literals_to_create_immutables, deprecated_member_use, unused_import, prefer_is_not_empty, depend_on_referenced_packages, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labib/Account/Login.dart';
import 'package:labib/MainPages/MainSectionPage.dart';
import 'package:labib/PlacementQuiz/PlacementTestPage.dart';
import 'package:labib/DataBase/DatabaseService.dart';
import 'package:labib/DataBase/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ExtraResourses/resourcesPage.dart';
import '../Words/WordsTest.dart';
import 'grades.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_mail_app/open_mail_app.dart';
import '../PlacementQuiz/result.dart';

class HomePage extends StatefulWidget {
  final String score;
  HomePage({Key? key, required this.score}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseService _databaseService = DatabaseService();
  late int grade;

  Future<bool> initAsync() async {
    Map<String, dynamic> result = await _databaseService.retrieveTestResult();
    grade = result['LettersGame'] + result['NumbersGame'];

    if (!result.isEmpty) return true;
    return false;
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: SizedBox(
        width: width * 0.696,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: height * 0.391,
                child: DrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(153, 192, 219, 241)),
                  child: Image(
                    image: AssetImage('assets/Reading.PNG'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "درجاتي",
                  textAlign: TextAlign.right,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => grades()),
                  );
                },
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                title: Text(
                  "مصادر اضافية",
                  textAlign: TextAlign.right,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => resourcesPage(
                              score: Result.score,
                            )),
                  );
                },
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                title: Text(
                  "تسجيل خروج",
                  textAlign: TextAlign.right,
                ),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool("isLoggedIn", false);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
              Divider(
                thickness: 2,
              ),
              ExpansionTile(
                title: Text(
                  "تواصل معنا",
                  textAlign: TextAlign.right,
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                              leading: Icon(Icons.phone),
                              title: Text(
                                "رقم الهاتف",
                                textAlign: TextAlign.right,
                              ),
                              onTap: _makingPhoneCall),
                          Divider(
                            thickness: 2,
                          ),
                          ListTile(
                            leading: Icon(Icons.mail),
                            title: Text(
                              "البريد الالكتروني ",
                              textAlign: TextAlign.right,
                            ),
                            onTap: _sendingMails,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/HomePage/HomePage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Positioned(
              //Hamburger bar
              left: width * 0.872,
              top: height * 0.082,
              right: null,
              bottom: null,
              child: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                },
                child: Image.asset(
                  "assets/images/Hamburgerbar.png",
                  width: width * 0.069,
                  height: height * 0.034,
                ),
              )),
          Positioned(
              //Letter Button
              left: width * 0.042,
              top: height * 0.434,
              right: null,
              bottom: null,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainSectionPage('A')));
                  },
                  
                  child: Image.asset(
                  "assets/HomePage/letterB.png",
                  width: width * 0.88,
                  height: height * 0.109,
                ),
                  )),
          Positioned(
              //Numbers Button
              left: width * 0.04,
              top: height * 0.578,
              right: null,
              bottom: null,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainSectionPage('B')));
                },
                child: Image.asset(
                  "assets/HomePage/numberB.png",
                  width: width * 0.88,
                  height: height * 0.109,
                ),
              )),



          Positioned(
              //Word Button
              left: width * 0.04,
              top: height * 0.727,
              right: null,
              bottom: null,
              child: GestureDetector(
                onTap: () async {
                  await initAsync();
                  if (widget.score == 'مبتدئ' && (grade != 15)) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Color.fromARGB(221, 237, 238, 237),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title: Center(
                                child: Text(
                              ' عذرًا! يجب أن تجتاز اختبار الحروف والارقام حتى تنتقل للمستوى التالي',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 36, 68, 95)),
                            )),
                            content: Image.asset(
                              'assets/Sad.PNG',
                              height: 150,
                              width: 150,
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'إغلاق',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 36, 68, 95)),
                                  ))
                            ],
                          );
                        });
                  } //end if
                  else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainSectionPage('C')));
                  }
                },
                child: Image.asset(
                  "assets/HomePage/wordB.png",
                  width: width * 0.877,
                  height: height * 0.109,
                ),
              )),




              
        ]),
      ),
    );
  }
}

_makingPhoneCall() async {
  const url = 'tel:0530088089';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_sendingMails() async {
  const url = 'mailto:labib@hotmail.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void showNoMailAppsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Open Mail App"),
        content: Text("No mail apps installed"),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
