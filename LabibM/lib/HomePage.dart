import 'package:flutter/material.dart';
import 'MainSectionPage.dart';

class HomePage extends StatelessWidget {
  final String score;

  HomePage({Key? key, required this.score}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: Container(
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
                    "مصادر اضافية",
                    textAlign: TextAlign.right,
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    "تواصل معنا",
                    textAlign: TextAlign.right,
                  ),
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
            Container(
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
                      onTap: () {
                        if (score == 'مبتدئ') {
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
                                    ' عذرًا ! يجب أن تجتاز اختبار الحروف والارقام حتى تنتقل للمستوى التالي',
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
