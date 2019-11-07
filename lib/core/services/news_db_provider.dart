//import 'package:flutter_base_project/core/models/user.dart';
//import 'package:flutter_base_project/core/services/base_service/repository.dart';
//import 'package:sqflite/sqflite.dart';
//import 'package:path_provider/path_provider.dart';
//import 'dart:io';
//import 'package:path/path.dart';
//import 'dart:async';
//
//class NewsDbProvider implements Source, Cache {
//  Database db;
//
//  NewsDbProvider() {
//    init();
//  }
//
//  // Todo - store and fetch top ids
//  Future<List<int>> fetchTopIds() {
//    return null;
//  }
//
//  void init() async {
//    Directory documentsDirectory = await getApplicationDocumentsDirectory();
//    final path = join(documentsDirectory.path, "items4.db");
//    db = await openDatabase(
//      path,
//      version: 1,
//      onCreate: (Database newDb, int version) {
//        newDb.execute("""
//          CREATE TABLE Items
//            (
//              id INTEGER PRIMARY KEY,
//              type TEXT,
//              by TEXT,
//              time INTEGER,
//              text TEXT,
//              parent INTEGER,
//              kids BLOB,
//              dead INTEGER,
//              deleted INTEGER,
//              url TEXT,
//              score INTEGER,
//              title TEXT,
//              descendants INTEGER
//            )
//        """);
//      },
//    );
//  }
//
//  Future<User> fetchItem(int id) async {
//    final maps = await db.query(
//      "Items",
//      columns: null,
//      where: "id = ?",
//      whereArgs: [id],
//    );
//
//    if (maps.length > 0) {
//      return User.fromDb(maps.first);
//    }
//
//    return null;
//  }
//
//  Future<int> addItem(User item) {
//    return db.insert(
//      "Items",
//      item.toMap(),
//      conflictAlgorithm: ConflictAlgorithm.ignore,
//    );
//  }
//
//  Future<int> clear() {
//    return db.delete("Items");
//  }
//}
//
//final newsDbProvider = NewsDbProvider();
