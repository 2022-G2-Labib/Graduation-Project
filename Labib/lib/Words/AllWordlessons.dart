import 'package:flutter/material.dart';

/* All Word lessons interface */
class AllWordlessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ])),
      ),
    );
  }
}
