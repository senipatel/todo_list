import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';

class Database_Helper {
  Database_Helper._constructor();

  static final instance = Database_Helper._constructor();

  Database? _database;

  Future<Database> get db async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'user.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''CREATE TABLE user(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      first_name TEXT,
      last_name TEXT,
      username TEXT,
      mobile_number TEXT,
      email_id TEXT,
      password TEXT
      )''');
      },
    );
  }

  Future<int> insertUser(User user) async {
    final db = await instance.db;
    return await db.insert("user", user.toMap());
  }

  Future<List<Map<String, Object?>>> checkLogin(
    String username,
    String password,
  ) async {
    final db = await instance.db;
    return await db.query(
      "user",
      where: 'username = ? and password = ?',
      whereArgs: [username, password],
    );
  }
}
