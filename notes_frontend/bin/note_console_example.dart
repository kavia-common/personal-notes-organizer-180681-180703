import 'dart:io';
import 'package:notes_frontend/models/note.dart';
import 'package:notes_frontend/utils/note_json.dart';

/// Standalone console example (no Flutter) to verify Note serialization.
void main() {
  final note = Note(
    title: 'Console Note',
    content: 'This runs without Flutter.',
    pinned: false,
    createdAt: DateTime.parse('2025-01-01T00:00:00.000Z'),
    updatedAt: DateTime.parse('2025-01-01T01:00:00.000Z'),
  );

  final jsonStr = NoteJson.encodeNote(note);
  final decoded = NoteJson.decodeNote(jsonStr);

  // Print a compact summary so CI can see output without relying on Flutter.
  stdout.writeln('title=${decoded.title}; pinned=${decoded.pinned}; color=${decoded.color.value}');
}
