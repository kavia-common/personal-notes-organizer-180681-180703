import 'package:notes_frontend/models/note.dart';

void main() {
  final now = DateTime.parse('2025-01-01T12:00:00.000Z');

  final note = Note(
    id: 1,
    title: 'Title',
    content: 'Body',
    pinned: true,
    createdAt: now,
    updatedAt: now,
  );

  // Basic sanity checks
  assert(note.id == 1);
  assert(note.title == 'Title');
  assert(note.pinned == true);

  // toMap/fromMap round-trip (db style fields)
  final map = note.toMap();
  final fromMap = Note.fromMap(map);
  assert(fromMap.id == note.id);
  assert(fromMap.title == note.title);
  assert(fromMap.content == note.content);
  assert(fromMap.pinned == note.pinned);
  assert(fromMap.color.value == note.color.value);

  // toJson/fromJson round-trip (json style fields)
  final json = note.toJson();
  final fromJson = Note.fromJson(json);
  assert(fromJson.title == note.title);
  assert(fromJson.pinned == note.pinned);

  // copyWith changes one field
  final n2 = note.copyWith(title: 'New');
  assert(n2.title == 'New');
  assert(n2.id == note.id);
}
