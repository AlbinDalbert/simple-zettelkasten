import 'package:sqflite/sqflite.dart';

enum noteType { fleeting, literature, permanent }

class Note {
  final noteType type;
  final int id;
  final String title;
  final int modified;
  final int created;

  const Note(
      {required this.type,
      required this.id,
      required this.title,
      required this.modified,
      required this.created});
}
