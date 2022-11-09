import 'package:labib/PlacementQuiz/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  Future<Map<String, dynamic>> checkDone() async {
    User? user = FirebaseAuth.instance.currentUser;
    Map<String, dynamic> result = {'letters': 0, 'numbers': 0, 'words': 0};

    var arr = [
      'A',
      'B',
      'T',
      'Th',
      'G',
      'Ha',
      'Kh',
      'D',
      'Tha',
      'R',
      'Z',
      'S',
      'Sh',
      'Ss',
      'Da',
      'Ta',
      'Tta',
      'Ain',
      'Ain2',
      'F',
      'Kaf',
      'K',
      'Lam',
      'M',
      'N',
      'H',
      'W',
      'Y',
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '290',
      '293',
      '288',
      '287',
      '273',
      '277',
      '226',
      '227',
      '162',
      '161',
      '160',
      '92',
      '93',
      '94',
      '95',
      '98',
      '100',
      '116',
      '117',
      '121'
    ];

    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection('lessons')
        .doc('letters')
        .get()
        .then((value) {
      for (int i = 0; i <= 27; i++) {
        if (value[arr[i]] == 1) {
          result['letters'] += 1;
        }
      }
    });
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .collection('lessons')
        .doc('numbers')
        .get()
        .then((value) {
      for (int i = 28; i <= 37; i++) {
        if (value[arr[i]] == 1) {
          result['numbers'] += 1;
        }
      }
    });
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .collection('lessons')
        .doc('words')
        .get()
        .then((value) {
      for (int i = 38; i <= 57; i++) {
        if (value[arr[i]] == 1) {
          result['words'] += 1;
        }
      }
    });
    return result;
  }

  Future<void> updateDone(String lessonSection, String lesson) async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference lessonDocument = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('lessons')
        .doc(lessonSection);
    DocumentSnapshot<Object?> querySnapshot = await lessonDocument.get();
    var data = querySnapshot.get(lesson);

    if (data == 1) {
      lessonDocument.update({lesson: 0});
    } else {
      lessonDocument.update({lesson: 1});
    }
  }

  Future<void> updateTestResult(
      String testname, int val, String testType) async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference testDocument = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('tests')
        .doc(testname);
    await testDocument.update({testType: val});
  }

  Future<Map<String, dynamic>> retrieveTestResult() async {
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference testCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('tests');

    QuerySnapshot querySnapshot = await testCollection.get();

    List map = querySnapshot.docs.map((doc) => doc.data()).toList();
   

    Map<String, dynamic> result = {
      'LettersGame': map[0]['GameGrade'],
      'AiATest': map[0]['AiGrade'],
      'AiATest2': map[0]['AiGrade2'],
      'NumbersGame': map[1]['GameGrade'],
      'AiBTest': map[1]['AiGrade'],
      'AiBTest2': map[1]['AiGrade2'],
      'wordsGame': map[3]['GameGrade'],
      'AiCTest': map[3]['AiGrade'],
      'AiCTest2': map[3]['AiGrade2'],
    };
    return result;
  }

  Future<String> retrieveDone(String lessonSection, String lesson) async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference lessonDocument = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('lessons')
        .doc(lessonSection);
    DocumentSnapshot<Object?> querySnapshot = await lessonDocument.get();
    var data = querySnapshot.get(lesson);

    return data.toString();
  }

  Future<Map<String, dynamic>> lessons(String lessonSection) async {
    User? user = FirebaseAuth.instance.currentUser;

    DocumentReference lessonCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('lessons')
        .doc(lessonSection);

    DocumentSnapshot<Object?> querySnapshot = await lessonCollection.get();
    var allData = querySnapshot.data();
    var map = Map<String, dynamic>.from(allData! as Map<dynamic, dynamic>);

    return map;
  }

  Future<int> getPlacmentTest() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference lessonDocument = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('tests')
        .doc('placementTest');
    DocumentSnapshot<Object?> querySnapshot = await lessonDocument.get();
    var data = querySnapshot.get('grade');
    return data;
  }

  Future<bool> cheakPlacmenttest(String test) async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference lessonDocument = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('tests')
        .doc(test);
    DocumentSnapshot<Object?> querySnapshot = await lessonDocument.get();
    var data = querySnapshot.get('grade');

    if (data == -1) {
      return false;
    } else {
      Result(data);
      return true;
    }
  }
}
