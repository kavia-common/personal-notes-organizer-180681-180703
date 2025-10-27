import 'package:notes_frontend/models/note.dart';
import 'package:notes_frontend/utils/note_json.dart';

void main() {
  final n = Note(
    title: 'Harness',
    content: 'Testing encode/decode',
    pinned: false,
    createdAt: DateTime.parse('2025-01-01T00:00:00.000Z'),
    updatedAt: DateTime.parse('2025-01-01T01:00:00.000Z'),
  );

  final s = NoteJson.encodeNote(n);
  final back = NoteJson.decodeNote(s);
  assert(back.title == n.title);
  assert(back.content == n.content);

  final listStr = NoteJson.encodeNotes([n, back]);
  final list = NoteJson.decodeNotes(listStr);
  assert(list.length == 2);
}
