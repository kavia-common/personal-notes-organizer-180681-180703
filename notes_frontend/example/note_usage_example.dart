import 'package:notes_frontend/models/note.dart';
import 'package:notes_frontend/utils/date_format.dart';
import 'package:flutter/material.dart';

void main() {
  final now = DateTime.now();
  final note = Note(
    id: null,
    title: 'Example',
    content: 'This is a simple example Note.',
    pinned: false,
    createdAt: now,
    updatedAt: now,
    color: const Color(0xFF2563EB),
  );

  final map = note.toMap();
  final fromMap = Note.fromMap(map);

  // ignore: avoid_print
  print('Note title: ${fromMap.title}');
  // ignore: avoid_print
  print('Created: ${DateFormatUtils.showFullDateTime(fromMap.createdAt)}');
}
