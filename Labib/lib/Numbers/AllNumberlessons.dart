import 'package:flutter/material.dart';
import '../DataBase/database_service.dart';
import '../HomePage.dart';
import '../DataBase/Lesson.dart';
import 'package:labeeb_app/PlacementQuiz/result.dart';

/* All Number lessons interface */
class AllNumberlessons extends StatelessWidget {
  final DatabaseService _databaseService = DatabaseService();
  late List<Lesson> donelist;

  Future<bool> initAsync() async {
    List<Lesson> queryRows = await _databaseService.lessons();
    donelist = queryRows;
    if ((!donelist.isEmpty)) return true;

    return false;
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 1.78,
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                  //blue background
                  left: 0.0,
                  top: 0.0,
                  right: null,
                  bottom: null,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 1.78,
                  child: Image.asset(
                    "assets/images/blueBackground1.png",
                  )),
              Positioned(
                  //number lesson title
                  left: MediaQuery.of(context).size.width * 0.265,
                  top: (MediaQuery.of(context).size.width * 1.78) * 0.108,
                  right: null,
                  bottom: null,
                  child: Image.asset(
                    "assets/images/numberLesson.png",
                    width: MediaQuery.of(context).size.width * 0.398,
                    height: (MediaQuery.of(context).size.width * 1.78) * 0.048,
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
                      height: (MediaQuery.of(context).size.width * 3.7) * 0.017,
                    ),
                  )),
              Positioned(
                  //back
                  left: MediaQuery.of(context).size.width * 0.056,
                  top: (MediaQuery.of(context).size.width * 1.78) * 0.055,
                  right: null,
                  bottom: null,
                  child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, "/GeneratedMainSectionFromNumbers"),
                      child: Image.asset(
                        "assets/images/back.png",
                        width: MediaQuery.of(context).size.width * 0.039,
                        height:
                            (MediaQuery.of(context).size.width * 1.78) * 0.026,
                      ))),
              Positioned(
                  //Home button
                  left: MediaQuery.of(context).size.width * 0.462,
                  top: (MediaQuery.of(context).size.width * 1.78) * 0.901,
                  right: null,
                  bottom: null,
                  width: MediaQuery.of(context).size.width * 0.075,
                  height: (MediaQuery.of(context).size.width * 1.78) * 0.045,
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
                      ))),
              FutureBuilder<bool>(
                  future: initAsync(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }

                    return Positioned(
                      child: Stack(children: [
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.169,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/Generated0Widget'),
                            child: Image.asset('assets/images/0small' +
                                donelist[28].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.169,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/Generated1Widget'),
                            child: Image.asset('assets/images/1small' +
                                donelist[29].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.169,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/Generated2Widget'),
                            child: Image.asset('assets/images/2small' +
                                donelist[30].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.352,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/Generated3Widget'),
                            child: Image.asset('assets/images/3small' +
                                donelist[31].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.352,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/Generated4Widget'),
                            child: Image.asset('assets/images/4small' +
                                donelist[32].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.352,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/Generated5Widget'),
                            child: Image.asset('assets/images/5small' +
                                donelist[33].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.534,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/Generated6Widget'),
                            child: Image.asset('assets/images/6small' +
                                donelist[34].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.534,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/Generated7Widget'),
                            child: Image.asset('assets/images/7small' +
                                donelist[35].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.534,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/Generated8Widget'),
                            child: Image.asset('assets/images/8small' +
                                donelist[36].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top: (MediaQuery.of(context).size.width * 1.78) *
                              0.717,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/Generated9Widget'),
                            child: Image.asset('assets/images/9small' +
                                donelist[37].done.toString() +
                                '.png'),
                          ),
                        ),
                      ]),
                    );
                  }),
            ])),
      ),
    );
  }
}
