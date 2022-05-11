// ignore_for_file: prefer_const_constructors, file_names, must_be_immutable, prefer_final_fields, prefer_const_literals_to_create_immutables, deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'ExtraResourses/resourcesPage.dart';
import 'MainSectionPage.dart';
import 'Words/WordsTest.dart';
import 'grades.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:labeeb_app/DataBase/database_service.dart';

class HomePage extends StatelessWidget {
  final String score;
  final DatabaseService _databaseService = DatabaseService();

  late int g;
  Future<bool> initAsync() async {
    Map<String, dynamic> r = await _databaseService.retrieveTestResult();
    g = r['lettersTest'] + r['numbersTest'];
    if (!r.isEmpty) return true;
    return false;
  }

  HomePage({Key? key, required this.score}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: SizedBox(
          width: 250,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 250.0,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(153, 192, 219, 241)),
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
                                score: '',
                              )),
                    );
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

                              /*() async {
                                // Android: Will open mail app or show native picker.
                                // iOS: Will open mail app if single mail app found.
                                var result = await OpenMailApp.openMailApp();
                                

                                // If no mail apps found, show error
                                if (!result.didOpen && !result.canOpen) {
                                  showNoMailAppsDialog(context);

                                  // iOS: if multiple mail apps found, show dialog to select.
                                  // There is no native intent/default app system in iOS so
                                  // you have to do it yourself.
                                } else if (!result.didOpen && result.canOpen) {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return MailAppPickerDialog(
                                        mailApps: result.options,
                                      );
                                    },
                                  );
                                }
                              },
                           */
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
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 1.78,
              child: Stack(children: [
                Positioned(
                    //blue background
                    left: 0.0,
                    top: 0.0,
                    right: null,
                    bottom: null,
                    child: Image.asset(
                      "assets/HomePage/HomePage.png",
                      width: MediaQuery.of(context).size.width,
                      height: (MediaQuery.of(context).size.width * 1.78),
                    )),
                Positioned(
                    //Hamburger bar
                    left: MediaQuery.of(context).size.width * 0.872,
                    top: (MediaQuery.of(context).size.width * 3.7) * 0.024,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState!.openEndDrawer();
                      },
                      child: Image.asset(
                        "assets/images/Hamburgerbar.png",
                        width: MediaQuery.of(context).size.width * 0.069,
                        height:
                            (MediaQuery.of(context).size.width * 3.7) * 0.017,
                      ),
                    )),
                Positioned(
                    //Letter Button
                    left: MediaQuery.of(context).size.width * 0.04,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.434,
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
                        width: MediaQuery.of(context).size.width * 0.88,
                        height:
                            (MediaQuery.of(context).size.width * 1.78) * 0.1125,
                      ),
                    )),
                Positioned(
                    //Numbers Button
                    left: MediaQuery.of(context).size.width * 0.04,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.578,
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
                        width: MediaQuery.of(context).size.width * 0.88,
                        height:
                            (MediaQuery.of(context).size.width * 1.78) * 0.1125,
                      ),
                    )),
                Positioned(
                    //Word Button
                    left: MediaQuery.of(context).size.width * 0.04,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.727,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () async {
                        await initAsync();
                        if (score == 'مبتدئ' && (g != 11)) {
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
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'إغلاق',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 36, 68, 95)),
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
                        width: MediaQuery.of(context).size.width * 0.88,
                        height:
                            (MediaQuery.of(context).size.width * 1.78) * 0.1125,
                      ),
                    )),
              ]),
            ),
          ],
        ),
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
          FlatButton(
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
