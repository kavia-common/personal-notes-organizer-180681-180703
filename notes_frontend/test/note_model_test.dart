import 'package:flutter_test/flutter_test.dart';
import 'package:notes_frontend/models/models.dart';

void main() {
  test('Note toMap/fromMap round-trip preserves fields', () {
    final now = DateTime(2025, 1, 1, 12, 0);
    final note = Note(
      id: 7,
      title: 'Hello',
      content: 'World',
      pinned: true,
      createdAt: now,
      updatedAt: now,
      color: NoteColors.oceanBlue,
    );

    final map = note.toMap();
    final decoded = Note.fromMap(map);

    expect(decoded.id, 7);
    expect(decoded.title, 'Hello');
    expect(decoded.content, 'World');
    expect(decoded.pinned, true);
    expect(decoded.color.value, NoteColors.oceanBlue.value);
    // Created/updated will be local-ified in fromMap; compare ISO strings for robustness
    expect(decoded.createdAt.toIso8601String(), now.toIso8601String());
    expect(decoded.updatedAt.toIso8601String(), now.toIso8601String());
  });

  test('Note.newNote factory sets sensible defaults', () {
    final n = Note.newNote(title: 'T', content: 'C');
    expect(n.id, isNull);
    expect(n.title, 'T');
    expect(n.content, 'C');
    expect(n.pinned, isFalse);
  });
}
