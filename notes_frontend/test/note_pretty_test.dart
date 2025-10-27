import 'package:flutter_test/flutter_test.dart';
import 'package:notes_frontend/models/note.dart';
import 'package:notes_frontend/models/note_pretty.dart';
import 'package:flutter/material.dart';

void main() {
  test('NotePretty provides human-friendly strings', () {
    final t = DateTime(2025, 1, 1, 10, 0);
    final note = Note(
      id: 1,
      title: 'Hello',
      content: 'World',
      pinned: false,
      createdAt: t,
      updatedAt: t,
      color: const Color(0xFF2563EB),
    );

    final titleRel = NotePretty.titleWithRelativeUpdated(note);
    final details = NotePretty.details(note);

    expect(titleRel.isNotEmpty, true);
    expect(details.contains('Created:'), true);
    expect(details.contains('Updated:'), true);
  });
}
