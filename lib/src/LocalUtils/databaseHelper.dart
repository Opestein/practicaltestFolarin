import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wakanowpracticaltest/src/LocalUtils/model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._();
  static final DatabaseHelper databaseHelper = DatabaseHelper._();

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "main.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute("CREATE TABLE User(id INTEGER PRIMARY KEY, token TEXT)");
    print("Created table");
  }

  Future<int> saveUser(UserDetails user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<List<UserDetails>> getUserDetails() async {
    var dbClient = await db;
    List<Map<String, dynamic>> res = await dbClient.query("User");
//    TotalGamesPlayed totalGamesPlayed =
//        res.isNotEmpty ? TotalGamesPlayed.map(res) : [];
    print(res.toString());
    return List.generate(res.length, (i) {
      return UserDetails(
        id: res[i]['id'],
        token: res[i]['token'],
      );
    });
  }

  Future<int> deleteUsers() async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }

  Future<bool> isLoggedIn() async {
    var dbClient = await db;
    var res = await dbClient.query("User");
    return res.length > 0 ? true : false;
  }
}
