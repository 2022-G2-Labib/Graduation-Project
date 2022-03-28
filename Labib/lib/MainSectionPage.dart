import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'QuizSectionPage.dart';
import 'PlacementQuiz/result.dart';

class MainSectionPage extends StatelessWidget {
  String page = 'A';
  MainSectionPage(this.page);

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
                    //Page background
                    left: 0.0,
                    top: 0.0,
                    right: null,
                    bottom: null,
                    child: Image.asset(
                      "assets/MainSectionPage/MainSectionPage.png",
                      width: MediaQuery.of(context).size.width,
                      height: (MediaQuery.of(context).size.width * 1.78),
                    )),
                Positioned(
                    //back button
                    left: MediaQuery.of(context).size.width * 0.056,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.055,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                        score: Result.score,
                                      )));
                        },
                        child: Image.asset(
                          "assets/images/back.png",
                          width: MediaQuery.of(context).size.width * 0.039,
                          height: (MediaQuery.of(context).size.width * 1.78) *
                              0.026,
                        ))),
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
                    //lesson button
                    left: MediaQuery.of(context).size.width * 0.047,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.468,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, "/Generated" + page),
                      child: Image.asset(
                        "assets/MainSectionPage/lessonButton.png",
                        width: MediaQuery.of(context).size.width * 0.90,
                        height:
                            (MediaQuery.of(context).size.width * 1.78) * 0.125,
                      ),
                    )),
                Positioned(
                    //quiz Button
                    left: MediaQuery.of(context).size.width * 0.047,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.65,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizSectionPage(page)));
                      },
                      child: Image.asset(
                        "assets/MainSectionPage/quizButton.png",
                        width: MediaQuery.of(context).size.width * 0.90,
                        height:
                            (MediaQuery.of(context).size.width * 1.78) * 0.125,
                      ),
                    )),
                Positioned(
                    //Home button
                    left: MediaQuery.of(context).size.width * 0.462,
                    top: (MediaQuery.of(context).size.width * 1.78) * 0.85,
                    right: null,
                    bottom: null,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                        score: Result.score,
                                      )));
                        },
                        child: Image.asset(
                          "assets/images/Home.png",
                          width: MediaQuery.of(context).size.width * 0.075,
                          height: (MediaQuery.of(context).size.width * 1.78) *
                              0.045,
                        ))),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
