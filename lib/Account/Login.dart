// ignore_for_file: library_private_types_in_public_api, unused_import, file_names, body_might_complete_normally_nullable, avoid_print, use_build_context_synchronously, prefer_const_constructors

import 'CreateAccount.dart';
import 'package:flutter/material.dart';
import 'package:labib/MainPages/HomePage.dart';
import 'package:labib/Account/WelcomePage.dart';
import 'package:labib/DataBase/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:labib/PlacementQuiz/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:labib/DataBase/DatabaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:labib/PlacementQuiz/PlacementTestPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  User? user = FirebaseAuth.instance.currentUser;
  bool isdone = false;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final DatabaseService _databaseService = DatabaseService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailController2 = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Account/LoginPage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Positioned(
              //back button
              left: width * 0.056,
              top: height * 0.055,
              right: null,
              bottom: null,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomePage()));
                  },
                  child: Image.asset(
                    "assets/images/back.png",
                    width: MediaQuery.of(context).size.width * 0.039,
                    height: (MediaQuery.of(context).size.width * 1.78) * 0.026,
                  ))),
          Positioned(
              //login Text
              left: width * 0.337,
              top: height * 0.305,
              right: null,
              bottom: null,
              child: Image.asset(
                "assets/Account/Tlogin.png",
                width: width * 0.616,
                height: height * 0.077,
              )),
          Positioned(
              child: Form(
                  key: _formKey,
                  child: Stack(children: [
                    Positioned(
                        //email
                        left: width * 0.045,
                        top: height * 0.414,
                        right: null,
                        bottom: null,
                        width: width * 0.905,
                        height: height * 0.094,
                        child: TextFormField(
                            autofocus: false,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your Email");
                              }
                              // reg expression for email validation
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please Enter a valid email");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              emailController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.mail),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(0, 20, 0, 20),
                              hintText: "الايميل",
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ))),
                    Positioned(
                        //password
                        left: width * 0.045,
                        top: height * 0.523,
                        right: null,
                        bottom: null,
                        width: width * 0.905,
                        height: height * 0.094,
                        child: TextFormField(
                            autofocus: false,
                            controller: passwordController,
                            obscureText: true,
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{6,}$');
                              if (value!.isEmpty) {
                                return ("Password is required for login");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid Password(Min. 6 Character)");
                              }
                            },
                            onSaved: (value) {
                              passwordController.text = value!;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.vpn_key),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(0, 20, 0, 20),
                              hintText: "كلمة السر",
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ))),
                    Positioned(
                        //Did forget password?
                        left: width * 0.045,
                        top: height * 0.615,
                        right: null,
                        bottom: null,
                        child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        insetPadding: EdgeInsets.all(5),
                                        title: Text('Rest Password'),
                                        content: TextFormField(
                                            autofocus: false,
                                            controller: emailController2,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return ("Please Enter Your Email");
                                              }
                                              // reg expression for email validation
                                              if (!RegExp(
                                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                                  .hasMatch(value)) {
                                                return ("Please Enter a valid email");
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              emailController2.text = value!;
                                            },
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: InputDecoration(
                                              suffixIcon:
                                                  const Icon(Icons.mail),
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 20, 0, 20),
                                              hintText: "الايميل",
                                              hintTextDirection:
                                                  TextDirection.rtl,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            )),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Send'),
                                            onPressed: () {
                                              _auth.sendPasswordResetEmail(
                                                  email: emailController2.text);
                                              Navigator.pop(context);
                                            },
                                          ),
                                          TextButton(
                                            child: Text('Cancel'),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ],
                                      ));
                            },
                            child: Image.asset(
                              "assets/Account/forget_password.png",
                              width: width * 0.905,
                              height: height * 0.044,
                            ))),
                    Positioned(
                        //Login button
                        left: width * 0.045,
                        top: height * 0.667,
                        right: null,
                        bottom: null,
                        child: GestureDetector(
                            onTap: () {
                              signIn(emailController.text,
                                  passwordController.text);
                            },
                            child: Image.asset(
                              "assets/Account/login_button.png",
                              width: width * 0.905,
                              height: height * 0.094,
                            ))),
                    Positioned(
                        //you do not have account?
                        left: width * 0.045,
                        top: height * 0.7625,
                        right: null,
                        bottom: null,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccount()));
                            },
                            child: Image.asset(
                              "assets/Account/createAccount.png",
                              width: width * 0.905,
                              height: height * 0.045,
                            ))),
                  ]))),
        ]),
      ),
    );
  }

  void signIn(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    late int queryRows;
    late String score;

    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) async => {
                  queryRows = await _databaseService.getPlacmentTest(),
                  score = queryRows <= 9 ? "مبتدئ" : "متقدم",
                  Result(queryRows),
                  prefs.setBool("isLoggedIn", true),
                  Fluttertoast.showToast(msg: "Login successfully :)"),
                  Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => HomePage(score: score)),
                      (route) => false),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "تم تسجيل الدخول بنجاح";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}
