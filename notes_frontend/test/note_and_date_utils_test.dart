import 'package:flutter_test/flutter_test.dart';
import 'package:notes_frontend/models/note.dart';
import 'package:notes_frontend/utils/date_format.dart';
import 'package:flutter/material.dart';

void main() {
  test('Note toMap/fromMap roundtrip', () {
    final now = DateTime.now();
    final note = Note(
      id: 1,
      title: 'Title',
      content: 'Content',
      pinned: true,
      createdAt: now,
      updatedAt: now,
      color: const Color(0xFF2563EB),
    );

    final map = note.toMap();
    final from = Note.fromMap(map);

    expect(from.id, note.id);
    expect(from.title, note.title);
    expect(from.content, note.content);
    expect(from.pinned, note.pinned);
    expect(from.color.value, note.color.value);
  });

  test('DateFormatUtils formatting returns non-empty strings', () {
    final now = DateTime.now();
    expect(DateFormatUtils.showShortDate(now).isNotEmpty, true);
    expect(DateFormatUtils.showTime(now).isNotEmpty, true);
    expect(DateFormatUtils.showFullDateTime(now).isNotEmpty, true);
    expect(DateFormatUtils.showRelative(now).isNotEmpty, true);
  });
}
