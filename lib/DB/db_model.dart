import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:zettelkasten/Literature/writeLiterature.dart';

enum NoteType { fleeting, literature, permanent }

const String tableFleeting = 'fleeting';
const String tableLiterature = 'literature';
const String tablePermanent = 'permanent';

class NoteFields {
  static const String id = '_id';
  static const String type = 'type';
  static const String title = 'title';
  static const String created = 'created';
  static const String modified = 'modified';
}

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
}
