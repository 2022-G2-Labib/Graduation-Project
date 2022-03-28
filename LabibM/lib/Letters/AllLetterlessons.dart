import 'package:flutter/material.dart';
import '../HomePage.dart';
import '../DataBase/Lesson.dart';
import '../DataBase/database_service.dart';
import 'package:labeeb_app/PlacementQuiz/result.dart';

/*All Letter lessons interface */
class AllLetterlessons extends StatelessWidget {
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
            height: MediaQuery.of(context).size.width * 3.7,
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                  //blue background
                  left: 0.0,
                  top: 0.0,
                  right: null,
                  bottom: null,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 3.7,
                  child: Image.asset(
                    "assets/images/blueBackground2.png",
                  )),
              Positioned(
                  //letter lesson title
                  left: MediaQuery.of(context).size.width * 0.265,
                  top: (MediaQuery.of(context).size.width * 3.7) * 0.050,
                  right: null,
                  bottom: null,
                  child: Image.asset(
                    "assets/images/letterLesson.png",
                    width: MediaQuery.of(context).size.width * 0.398,
                    height: (MediaQuery.of(context).size.width * 3.7) * 0.023,
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
                  top: (MediaQuery.of(context).size.width * 3.7) * 0.026,
                  right: null,
                  bottom: null,
                  child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, "/GeneratedMainSectionFromLetters"),
                      child: Image.asset(
                        "assets/images/back.png",
                        width: MediaQuery.of(context).size.width * 0.039,
                        height:
                            (MediaQuery.of(context).size.width * 3.7) * 0.013,
                      ))),
              Positioned(
                  //Home button
                  left: MediaQuery.of(context).size.width * 0.462,
                  top: (MediaQuery.of(context).size.width * 3.7) * 0.974,
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
                        height:
                            (MediaQuery.of(context).size.width * 3.7) * 0.023,
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
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.082,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedAWidget'),
                            child: Image.asset('assets/images/Asmall' +
                                donelist[0].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.082,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedBWidget'),
                            child: Image.asset('assets/images/Bsmall' +
                                donelist[1].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.082,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedTWidget'),
                            child: Image.asset('assets/images/Tsmall' +
                                donelist[2].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.169,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedThWidget'),
                            child: Image.asset('assets/images/Thsmall' +
                                donelist[3].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.169,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedGWidget'),
                            child: Image.asset('assets/images/Gsmall' +
                                donelist[4].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.169,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedHaWidget'),
                            child: Image.asset('assets/images/Hasmall' +
                                donelist[5].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.258,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedThaWidget'),
                            child: Image.asset('assets/images/Thasmall' +
                                donelist[8].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.258,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedKhWidget'),
                            child: Image.asset('assets/images/Khsmall' +
                                donelist[6].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.258,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedDWidget'),
                            child: Image.asset('assets/images/Dsmall' +
                                donelist[7].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.346,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedRWidget'),
                            child: Image.asset('assets/images/Rsmall' +
                                donelist[9].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.353,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.346,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedZWidget'),
                            child: Image.asset('assets/images/Zsmall' +
                                donelist[10].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.346,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedSWidget'),
                            child: Image.asset('assets/images/Ssmall' +
                                donelist[11].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.014,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.434,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedShWidget'),
                            child: Image.asset('assets/images/Shsmall' +
                                donelist[12].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.345,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.434,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedSsWidget'),
                            child: Image.asset('assets/images/Sssmall' +
                                donelist[13].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.677,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.433,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedDaWidget'),
                            child: Image.asset('assets/images/Dasmall' +
                                donelist[14].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.014,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.522,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedTaWidget'),
                            child: Image.asset('assets/images/Tasmall' +
                                donelist[15].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.345,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.522,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedTtaWidget'),
                            child: Image.asset('assets/images/Ttasmall' +
                                donelist[16].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.677,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.522,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedAinWidget'),
                            child: Image.asset('assets/images/Ainsmall' +
                                donelist[17].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.014,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.610,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedAin2Widget'),
                            child: Image.asset('assets/images/Ain2small' +
                                donelist[18].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.677,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.610,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedKafWidget'),
                            child: Image.asset('assets/images/Kafsmall' +
                                donelist[20].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.345,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.610,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedFWidget'),
                            child: Image.asset('assets/images/Fsmall' +
                                donelist[19].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.014,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.699,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedKWidget'),
                            child: Image.asset('assets/images/Ksmall' +
                                donelist[21].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.345,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.699,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedLamWidget'),
                            child: Image.asset('assets/images/Lamsmall' +
                                donelist[22].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.677,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.699,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedMWidget'),
                            child: Image.asset('assets/images/Msmall' +
                                donelist[23].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.786,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedNWidget'),
                            child: Image.asset('assets/images/Nsmall' +
                                donelist[24].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.354,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.786,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedHWidget'),
                            child: Image.asset('assets/images/Hsmall' +
                                donelist[25].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.685,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.786,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedWWidget'),
                            child: Image.asset('assets/images/Wsmall' +
                                donelist[26].done.toString() +
                                '.png'),
                          ),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.022,
                          top:
                              (MediaQuery.of(context).size.width * 3.7) * 0.880,
                          right: null,
                          bottom: null,
                          width: MediaQuery.of(context).size.width * 0.29,
                          height: MediaQuery.of(context).size.width * 0.29,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, '/GeneratedYWidget'),
                            child: Image.asset('assets/images/Ysmall' +
                                donelist[27].done.toString() +
                                '.png'),
                          ),
                        )
                      ]),
                    );
                  }),
            ])),
      ),
    );
  }
}
