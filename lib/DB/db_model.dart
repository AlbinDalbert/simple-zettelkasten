import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:zettelkasten/Literature/writeLiterature.dart';

//enum NoteType { fleeting, literature, permanent }

const String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [id, type, title, created, modified];

  static const String id = '_id';
  static const String type = 'type';
  static const String title = 'title';
  static const String created = 'created';
  static const String modified = 'modified';
}

class Note {
  final int? id;
  final int type;
  final String title;
  final DateTime created;
  final DateTime modified;

  const Note(
      {required this.id,
      required this.type,
      required this.title,
      required this.created,
      required this.modified});

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        type: json[NoteFields.type] as int,
        title: json[NoteFields.title] as String,
        created: DateTime.parse(json[NoteFields.created] as String),
        modified: DateTime.parse(json[NoteFields.modified] as String),
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.type: type,
        NoteFields.title: title,
        NoteFields.created: created.toIso8601String(),
        NoteFields.modified: modified.toIso8601String(),
      };

  Note copy({
    int? id,
    int? type,
    String? title,
    DateTime? created,
    DateTime? modified,
  }) =>
      Note(
        id: id ?? this.id,
        type: type ?? this.type,
        title: title ?? this.title,
        created: created ?? this.created,
        modified: modified ?? this.modified,
      );
}
