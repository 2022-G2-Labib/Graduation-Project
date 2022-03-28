import 'package:flutter/material.dart';
import 'package:labeeb_app/DataBase/database_service.dart';

class Numberlesson extends StatefulWidget {
  final String widgtNumber;
  Numberlesson(this.widgtNumber);

  @override
  State<StatefulWidget> createState() {
    return _NumberlessonState();
  }
}

class _NumberlessonState extends State<Numberlesson> {
  final DatabaseService _databaseService = DatabaseService();
  late String done;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> initAsync() async {
    String d = await _databaseService.retrieveDone(widget.widgtNumber);
    done = d.toString();
    if (!done.isEmpty) return true;

    return false;
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<bool>(
        future: initAsync(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

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
                          "assets/images/lessonBackground.png",
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * 1.78,
                        )),
                    Positioned(
                        //number lesson title
                        left: MediaQuery.of(context).size.width * 0.123,
                        top: (MediaQuery.of(context).size.width * 1.78) * 0.138,
                        right: null,
                        bottom: null,
                        child: Image.asset(
                          "assets/images/numberLesson.png",
                          width: MediaQuery.of(context).size.width * 0.398,
                          height: (MediaQuery.of(context).size.width * 1.78) *
                              0.048,
                        )),
                    Positioned(
                        //back
                        left: MediaQuery.of(context).size.width * 0.056,
                        top: (MediaQuery.of(context).size.width * 1.78) * 0.055,
                        right: null,
                        bottom: null,
                        child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, "/GeneratednumberLessonWidget"),
                            child: Image.asset(
                              "assets/images/back.png",
                              width: MediaQuery.of(context).size.width * 0.039,
                              height:
                                  (MediaQuery.of(context).size.width * 1.78) *
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
                            height: (MediaQuery.of(context).size.width * 3.7) *
                                0.017,
                          ),
                        )),
                    Positioned(
                      //footer
                      left: MediaQuery.of(context).size.width * 0.142,
                      top: (MediaQuery.of(context).size.width * 1.78) * 0.830,
                      right: null,
                      bottom: null,
                      width: MediaQuery.of(context).size.width * 0.719,
                      height:
                          (MediaQuery.of(context).size.width * 1.78) * 0.147,
                      child: Stack(children: [
                        Positioned(
                          //next
                          left: MediaQuery.of(context).size.width * 0.607,
                          top: 0.0,
                          right: null,
                          bottom: null,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context,
                                '/Generated' + MoveSwitch('N') + 'Widget'),
                            child: Image.asset(
                              "assets/images/Next.png",
                              width: MediaQuery.of(context).size.width * 0.111,
                              height: MediaQuery.of(context).size.width * 0.111,
                            ),
                          ),
                        ),
                        Positioned(
                          //check
                          left: MediaQuery.of(context).size.width * 0.304,
                          top: 0.0,
                          right: null,
                          bottom: null,
                          child: GestureDetector(
                            onTap: () async {
                              await _databaseService
                                  .updateDone(widget.widgtNumber);
                              /* List<Lesson> queryRows =
                                  await _databaseService.retrieve(widget.widgtNumber);
                              print(queryRows);*/
                              setState(() {});
                            },
                            child: Image.asset(
                              "assets/images/Check" + done + ".png",
                              width: MediaQuery.of(context).size.width * 0.111,
                              height: MediaQuery.of(context).size.width * 0.111,
                            ),
                          ),
                        ),
                        Positioned(
                          //previous
                          left: 0.0,
                          top: 0.0,
                          right: null,
                          bottom: null,
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context,
                                '/Generated' + MoveSwitch('P') + 'Widget'),
                            child: Image.asset(
                              "assets/images/Previous.png",
                              width: MediaQuery.of(context).size.width * 0.111,
                              height: MediaQuery.of(context).size.width * 0.111,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.136,
                      top: (MediaQuery.of(context).size.width * 1.78) * 0.336,
                      right: null,
                      bottom: null,
                      width: MediaQuery.of(context).size.width * 0.735,
                      height:
                          (MediaQuery.of(context).size.width * 1.78) * 0.428,
                      child: Image.asset(
                          'assets/images/' + widget.widgtNumber + 'l.png'),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.189,
                      top: (MediaQuery.of(context).size.width * 1.78) * 0.3609,
                      right: null,
                      bottom: null,
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, '/GeneratednumberLessonWidget'),
                        child: Image.asset(
                          'assets/images/x.png',
                          width: MediaQuery.of(context).size.width * 0.019,
                          height: (MediaQuery.of(context).size.width * 1.78) *
                              0.014,
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.042,
                      top: (MediaQuery.of(context).size.width * 1.78) * 0.017,
                      right: null,
                      bottom: null,
                      width: MediaQuery.of(context).size.width * 0.111,
                      height: MediaQuery.of(context).size.width * 0.111,
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, '/GeneratednumberLessonWidget'),
                        child: Text("   "),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String MoveSwitch(String move) {
    switch (widget.widgtNumber) {
      case '0':
        if (move == 'N')
          return '1';
        else
          return '9';
        break;
      case '1':
        if (move == 'N')
          return '2';
        else
          return '0';
        break;

      case "2":
        if (move == "N")
          return "3";
        else
          return "1";
        break;

      case '3':
        if (move == 'N')
          return '4';
        else
          return '2';
        break;

      case '4':
        if (move == 'N')
          return '5';
        else
          return '3';
        break;

      case '5':
        if (move == 'N')
          return '6';
        else
          return '4';
        break;

      case '6':
        if (move == 'N')
          return '7';
        else
          return '5';
        break;

      case '7':
        if (move == 'N')
          return '8';
        else
          return '6';
        break;

      case '8':
        if (move == 'N')
          return '9';
        else
          return '7';
        break;

      case '9':
        if (move == 'N')
          return '1';
        else
          return '8';
        break;
      default:
        print('Letter Not Found');
    }
    return '0';
  }
}
