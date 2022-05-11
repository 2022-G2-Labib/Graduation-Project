// ignore_for_file: unused_local_variable, curly_braces_in_flow_control_structures, avoid_print

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Lesson.dart';
import 'package:labeeb_app/PlacementQuiz/result.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    await insertFirstTime();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'flutter_sqflite_database.db');
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE lessons(name TEXT PRIMARY KEY, done INTEGER)",
    );
    await db.execute(
      "CREATE TABLE test(placementTest INTEGER, lettersTest INTEGER, numbersTest INTEGER, wordsTest INTEGER)",
    );
  }

  Future<void> updateDone(String L) async {
    int done;
    final db = await _databaseService.database;
    var resultSet =
        await db.rawQuery('SELECT done from lessons WHERE name = ?', [L]);
    if (resultSet[0]['done'] == 0) {
      done = 1;
    } else {
      done = 0;
    }
    await db.rawUpdate('UPDATE lessons SET done = ? WHERE name = ?', [done, L]);
  }

  Future<String> retrieveDone(String L) async {
    int done;
    final db = await _databaseService.database;
    var resultSet =
        await db.rawQuery('SELECT done from lessons WHERE name = ?', [L]);
    if (resultSet[0]['done'] == 0) {
      done = 0;
    } else {
      done = 1;
    }
    return done.toString();
  }

  Future<bool> insertLesson(Lesson lesson) async {
    final db = await _databaseService.database;
    await db.insert(
      'lessons',
      lesson.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return true;
  }

  Future<bool> insertResult(Map<String, dynamic> value) async {
    final db = await _databaseService.database;
    await db.insert(
      'test',
      value,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return true;
  }

  Future<List<Lesson>> lessons() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('lessons');
    return List.generate(maps.length, (index) => Lesson.fromMap(maps[index]));
  }

  Future<bool> insertFirstTime() async {
    final db = await _databaseService.database;
    var x = await db.rawQuery('SELECT COUNT(*) FROM lessons');
    int? count = Sqflite.firstIntValue(x);

    if ((count == 0) | (count!.isNaN)) {
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
      for (int i = 0; i < arr.length; i++) {
        await _databaseService.insertLesson(Lesson(name: arr[i], done: 0));
      }
      await _databaseService.insertResult({
        'placementTest': -1,
        'lettersTest': -1,
        'numbersTest': -1,
        'wordsTest': -1,
      });

      return true;
    } else {
      return false;
    }
  }

  Future<void> updateTestResult(int d, String testName) async {
    final db = await _databaseService.database;
    await db.rawUpdate('UPDATE test SET ' + testName + '= ?', [d]);
  }

  Future<bool> cheaktest() async {
    final db = await _databaseService.database;
    var sc = await db.rawQuery('SELECT placementTest FROM test');
    int k = sc[0]['placementTest'] as int;
    if (k == -1) {
      return false;
    } else {
      Result(k);
      return true;
    }
  }

  Future<Map<String, dynamic>> retrieveTestResult() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('test');

    Map<String, dynamic> value = {
      'placementTest': maps[0]['placementTest'],
      'lettersTest': maps[0]['lettersTest'],
      'numbersTest': maps[0]['numbersTest'],
      'wordsTest': maps[0]['wordsTest'],
    };
    return value;
  }
}
