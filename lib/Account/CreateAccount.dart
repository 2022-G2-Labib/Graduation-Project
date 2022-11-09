// ignore_for_file: body_might_complete_normally_nullable, file_names

import 'package:flutter/material.dart';
import 'package:labib/Account/WelcomePage.dart';
import 'package:labib/PlacementQuiz/PlacementTestPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:labib/DataBase/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  bool isdone = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Account/CreateAccountPage.png"),
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
                    width: width * 0.039,
                    height: height * 0.026,
                  ))),
          Positioned(
              //create account Text
              left: width * 0.334,
              top: height * 0.233,
              right: null,
              bottom: null,
              child: Image.asset(
                "assets/Account/Tcreate_account.png",
                width: width * 0.616,
                height: height * 0.077,
              )),
          Positioned(
              child: Form(
                  key: _formKey,
                  child: Stack(children: [
                    Positioned(
                        //name
                        left: width * 0.045,
                        top: height * 0.323,
                        right: null,
                        bottom: null,
                        width: width * 0.905,
                        height: height * 0.094,
                        child: TextFormField(
                            autofocus: false,
                            controller: firstNameEditingController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{3,}$');
                              if (value!.isEmpty) {
                                return ("First Name cannot be Empty");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid name(Min. 3 Character)");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              firstNameEditingController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.account_circle),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(0, 20, 0, 20),
                              hintText: "الإسم",
                              hintTextDirection: TextDirection.rtl,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ))),
                    Positioned(
                        //email
                        left: width * 0.045,
                        top: height * 0.433,
                        right: null,
                        bottom: null,
                        width: width * 0.905,
                        height: height * 0.094,
                        child: TextFormField(
                            autofocus: false,
                            controller: emailEditingController,
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
                              firstNameEditingController.text = value!;
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
                        left: width * 0.047,
                        top: height * 0.542,
                        right: null,
                        bottom: null,
                        width: width * 0.905,
                        height: height * 0.094,
                        child: TextFormField(
                            autofocus: false,
                            controller: passwordEditingController,
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
                              firstNameEditingController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
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
                        //Do you have account?
                        left: width * 0.234,
                        top: height * 0.6359,
                        right: null,
                        bottom: null,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            },
                            child: Image.asset(
                              "assets/Account/have_account.png",
                              width: width * 0.7158,
                              height: height * 0.0625,
                            ))),
                    Positioned(
                        //Creat account button
                        left: width * 0.045,
                        top: height * 0.698,
                        right: null,
                        bottom: null,
                        child: GestureDetector(
                            onTap: () {
                              signUp(emailEditingController.text,
                                  passwordEditingController.text);
                            },
                            child: Image.asset(
                              "assets/Account/createAccount_button.png",
                              width: width * 0.905,
                              height: height * 0.094,
                            ))),
                  ]))),
        ]),
      ),
    );
  }

  void signUp(String email, String password) async {
    print(email);
    print(password);
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {
                  postDetailsToFirestore(),
                  Navigator.pushAndRemoveUntil(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => PlacementTestPage()),
                      (route) => false),
                })
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
            errorMessage =
                "Creating account with Email and Password is not enabled.";
            break;

          case "account-exists-with-different-credential":
            errorMessage =
                "The account already exists with a different credential.";
            break;
          case "email-already-exists":
            errorMessage = "The account already exists.";
            break;

          default:
            errorMessage = "An undefined Error happened.";
        }
        print(errorMessage);
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    print('1');

    UserModel userModel = UserModel();
    print('2');
    userModel.email = user!.email;
    print('3');
    userModel.uid = user.uid;
    print('4');
    userModel.firstName = firstNameEditingController.text;
    print('5');
    //Create the user document
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    
    print('6');
    //Create the test collection
    CollectionReference testCollection =
        firebaseFirestore.collection('users').doc(user.uid).collection('tests');

    //Create placementTest document
    testCollection.doc('placementTest').set({
      'grade': -1,
    });
    //Create lettersTest document
    testCollection.doc('lettersTest').set({
      'GameGrade': -1,
      'AiGrade': -1,
      'AiGrade2': -1,
    });
    //Create numbersTest document
    testCollection.doc('numbersTest').set({
      'GameGrade': -1,
      'AiGrade': -1,
      'AiGrade2': -1,
    });
    //Create wordsTest document
    testCollection.doc('wordsTest').set({
      'GameGrade': -1,
      'AiGrade': -1,
      'AiGrade2': -1,
    });

    //Create the lesson collection + letter, number, words document
    CollectionReference lessonCollection = firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .collection('lessons');

    //Create number document
    lessonCollection.doc('numbers').set({
      '0': 0,
      '1': 0,
      '2': 0,
      '3': 0,
      '4': 0,
      '5': 0,
      '6': 0,
      '7': 0,
      '8': 0,
      '9': 0,
    });
    //Create words document
    lessonCollection.doc('words').set({
      '290': 0,
      '293': 0,
      '288': 0,
      '287': 0,
      '273': 0,
      '277': 0,
      '226': 0,
      '227': 0,
      '162': 0,
      '161': 0,
      '160': 0,
      '92': 0,
      '93': 0,
      '94': 0,
      '95': 0,
      '98': 0,
      '100': 0,
      '116': 0,
      '117': 0,
      '121': 0,
    });
    //Create letter document
    lessonCollection.doc('letters').set({
      'A': 0,
      'B': 0,
      'T': 0,
      'Th': 0,
      'G': 0,
      'Ha': 0,
      'Kh': 0,
      'D': 0,
      'Tha': 0,
      'R': 0,
      'Z': 0,
      'S': 0,
      'Sh': 0,
      'Ss': 0,
      'Da': 0,
      'Ta': 0,
      'Tta': 0,
      'Ain': 0,
      'Ain2': 0,
      'F': 0,
      'Kaf': 0,
      'K': 0,
      'Lam': 0,
      'M': 0,
      'N': 0,
      'H': 0,
      'W': 0,
      'Y': 0,
    });

    Fluttertoast.showToast(msg: "تم انشاء الحساب بنجاح ");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLoggedIn", true);
    prefs.setBool("placement", false);
  }
}
