// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'Login.dart';
import 'CreateAccount.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/welcomePage/welcomePage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Positioned(
              //Welcome Text
              left: width * 0.279,
              top: height * 0.556,
              right: null,
              bottom: null,
              child: Image.asset(
                "assets/welcomePage/Text.png",
                width: width * 0.487,
                height: height * 0.145,
              )),
          Positioned(
              //Creat account button
              left: width * 0.047,
              top: height * 0.792,
              right: null,
              bottom: null,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAccount()));
                  },
                  child: Image.asset(
                    "assets/Account/createAccount_button.png",
                    width: width * 0.905,
                    height: height * 0.094,
                  ))),
          Positioned(
              //Do you have account?
              left: width * 0.181,
              top: height * 0.886,
              right: null,
              bottom: null,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: Image.asset(
                    "assets/welcomePage/have_account.png",
                    width: width * 0.635,
                    height: height * 0.0625,
                  ))),
        ]),
      ),
    );
  }
}
