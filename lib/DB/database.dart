import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

enum NoteType { fleeting, literature, permanent }

class Note {
  final int id;
  final NoteType type;
  final String title;
  final int created;
  final int modified;

  const Note(
      {required this.id,
      required this.type,
      required this.title,
      required this.created,
      required this.modified});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'created': created,
      'modified': modified,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, type: $type, title: $title, created: $created, modified: $modified}';
  }
}

void initDatabased() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'doggie_database.db'),
  );
}

class DatabaseHandler {
  final database;
  DatabaseHandler(this.database) {
    initDatabased();
  }

  Future<void> insertNote(Note note, database) async {
    final db = await database;
    await db.insert(
      'note',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
