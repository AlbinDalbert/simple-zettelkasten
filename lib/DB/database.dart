import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'db_model.dart';

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

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const typeType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableNotes (
  ${NoteFields.id} $idType,
  ${NoteFields.type} $typeType,
  ${NoteFields.title} $textType,
  ${NoteFields.created} $textType,
  ${NoteFields.modified} $textType,
)
''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;
    final id = await db.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }

  Future<Note> readNote(int id) async {
    final db = await instance.database;

    final res = await db.query(tableNotes,
        columns: NoteFields.values,
        where: '${NoteFields.id} = ?',
        whereArgs: [id]);
    if (res.isNotEmpty) {
      return Note.fromJson(res.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    final res = await db.query(tableNotes);

    return res.map((json) => Note.fromJson(json)).toList();
}
