import 'package:notes_frontend/models/models.dart';
import 'package:notes_frontend/utils/utils.dart';

/// Simple example to demonstrate constructing a Note, mapping it, and formatting times.
/// Run from app root with:
///   dart tool/note_usage_example.dart
void main() {
  final note = Note.newNote(title: 'Example', content: 'Quick demo');
  final map = note.toMap();
  final restored = Note.fromMap(map);
  final ts = DateFormatUtils.showFullDateTime(restored.updatedAt);

  // ignore: avoid_print
  print('Note "${restored.title}" at $ts, color=${restored.color.value}');
}
