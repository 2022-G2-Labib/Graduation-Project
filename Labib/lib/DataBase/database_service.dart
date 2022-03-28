import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Lesson.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    insertFirstTime();
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
      'CREATE TABLE lessons(id INTEGER PRIMARY KEY, name TEXT, done INTEGER)',
    );
  }

  Future<void> insertFirstTime() async {
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
        '9'
      ];
      for (int i = 0; i < arr.length; i++) {
        await _databaseService.insertLesson(Lesson(name: arr[i], done: 0));
      }
      return;
    } else {
      return;
    }
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

  Future<List<Lesson>> lessons() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('lessons');
    return List.generate(maps.length, (index) => Lesson.fromMap(maps[index]));
  }

  Future<void> updateLesson(Lesson lesson) async {
    final db = await _databaseService.database;
    await db.update('lessons', lesson.toMap(),
        where: 'id = ?', whereArgs: [lesson.id]);
  }

  Future<void> deleteLesson(int id) async {
    final db = await _databaseService.database;
    await db.delete('lessons', where: 'id = ?', whereArgs: [id]);
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

  Future<List<Lesson>> retrieve(String L) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db
        .rawQuery('SELECT id, name, done from lessons WHERE name = ?', [L]);
    return List.generate(maps.length, (index) => Lesson.fromMap(maps[index]));
  }
}
