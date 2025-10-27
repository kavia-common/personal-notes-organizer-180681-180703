import 'dart:convert';
import 'package:notes_frontend/models/models.dart';

/// Debug utility to round-trip a Note through map/json serialization.
/// Run from app root:
///   dart tool/dev_note_roundtrip.dart
void main() {
  final note = Note(
    title: 'RoundTrip',
    content: 'Ensuring toMap/fromMap works',
    pinned: false,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  final map = note.toMap();
  final jsonStr = jsonEncode(map);
  final decoded = Note.fromMap(jsonDecode(jsonStr) as Map<String, dynamic>);

  print('Original: ${note.title} -> Decoded: ${decoded.title}');
}
