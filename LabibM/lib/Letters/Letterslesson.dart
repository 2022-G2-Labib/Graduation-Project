import 'package:flutter/material.dart';
import 'package:labeeb_app/DataBase/database_service.dart';

class Letterslesson extends StatefulWidget {
  final String widgtName;
  Letterslesson(this.widgtName);

  @override
  State<StatefulWidget> createState() {
    return _LetterslessonState();
  }
}

class _LetterslessonState extends State<Letterslesson> {
  final DatabaseService _databaseService = DatabaseService();
  late String done;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> initAsync() async {
    String d = await _databaseService.retrieveDone(widget.widgtName);
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
                          "assets/images/letterLesson.png",
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
                                context, "/GeneratedLetterlessonsWidget"),
                            child: Image.asset(
                              "assets/images/back.png",
                              width: MediaQuery.of(context).size.width * 0.039,
                              height:
                                  (MediaQuery.of(context).size.width * 1.78) *
                                      0.026,
                            ))),
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
                                  .updateDone(widget.widgtName);

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
                          'assets/images/' + widget.widgtName + '.png'),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.189,
                      top: (MediaQuery.of(context).size.width * 1.78) * 0.3609,
                      right: null,
                      bottom: null,
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, '/GeneratedLetterlessonsWidget'),
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
                            context, '/GeneratedLetterlessonsWidget'),
                        child: Text("   "),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  String MoveSwitch(String move) {
    switch (widget.widgtName) {
      case "A":
        if (move == 'N')
          return "B";
        else
          return "Y";
        break;

      case "B":
        if (move == "N")
          return "T";
        else
          return "A";
        break;

      case 'T':
        if (move == 'N')
          return 'Th';
        else
          return 'B';
        break;

      case 'Th':
        if (move == 'N')
          return 'G';
        else
          return 'T';
        break;

      case 'G':
        if (move == 'N')
          return 'Ha';
        else
          return 'Th';
        break;

      case 'Ha':
        if (move == 'N')
          return 'Kh';
        else
          return 'G';
        break;

      case 'Kh':
        if (move == 'N')
          return 'D';
        else
          return 'Ha';
        break;

      case 'D':
        if (move == 'N')
          return 'Tha';
        else
          return 'Kh';
        break;

      case 'Tha':
        if (move == 'N')
          return 'R';
        else
          return 'D';
        break;

      case 'R':
        if (move == 'N')
          return 'Z';
        else
          return 'Tha';
        break;

      case 'Z':
        if (move == 'N')
          return 'S';
        else
          return 'R';
        break;

      case 'S':
        if (move == 'N')
          return 'Sh';
        else
          return 'Z';
        break;

      case 'Sh':
        if (move == 'N')
          return 'Ss';
        else
          return 'S';
        break;

      case 'Ss':
        if (move == 'N')
          return 'Da';
        else
          return 'Sh';
        break;

      case 'Da':
        if (move == 'N')
          return 'Ta';
        else
          return 'Ss';
        break;

      case 'Ta':
        if (move == 'N')
          return 'Tta';
        else
          return 'Da';
        break;

      case 'Tta':
        if (move == 'N')
          return 'Ain';
        else
          return 'Ta';
        break;

      case 'Ain':
        if (move == 'N')
          return 'Ain2';
        else
          return 'Tta';
        break;

      case 'Ain2':
        if (move == 'N')
          return 'F';
        else
          return 'Ain';
        break;

      case 'F':
        if (move == 'N')
          return 'Kaf';
        else
          return 'Ain2';
        break;

      case 'Kaf':
        if (move == 'N')
          return 'K';
        else
          return 'F';
        break;

      case 'K':
        if (move == 'N')
          return 'Lam';
        else
          return 'Kaf';
        break;

      case 'Lam':
        if (move == 'N')
          return 'M';
        else
          return 'K';
        break;

      case 'M':
        if (move == 'N')
          return 'N';
        else
          return 'Lam';
        break;

      case 'N':
        if (move == 'N')
          return 'H';
        else
          return 'M';
        break;

      case 'H':
        if (move == 'N')
          return 'W';
        else
          return 'N';
        break;

      case 'W':
        if (move == 'N')
          return 'Y';
        else
          return 'H';
        break;

      case 'Y':
        if (move == 'N')
          return 'A';
        else
          return 'W';
        break;
      default:
        print('Letter Not Found');
    }
    return 'A';
  }
}
