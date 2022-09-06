import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

enum NoteType { fleeting, literature, permanent }

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    _database ??= await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {}

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
