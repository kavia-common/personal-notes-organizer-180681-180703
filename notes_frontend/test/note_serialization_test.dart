import 'package:flutter_test/flutter_test.dart';
import 'package:notes_frontend/models/note.dart';
import 'package:notes_frontend/models/note_mappers.dart';
import 'package:flutter/material.dart';

void main() {
  test('Note toJson/fromJson roundtrip', () {
    final now = DateTime(2025, 1, 1, 12, 0);
    final original = Note(
      id: 42,
      title: 'Serialize',
      content: 'Roundtrip',
      pinned: true,
      createdAt: now,
      updatedAt: now,
      color: const Color(0xFF2563EB),
    );

    final json = original.toJson();
    final reconstructed = Note.fromJson(json);

    expect(reconstructed.id, original.id);
    expect(reconstructed.title, original.title);
    expect(reconstructed.content, original.content);
    expect(reconstructed.pinned, original.pinned);
    expect(reconstructed.color.value, original.color.value);
  });

  test('NoteMappers fromIterable/toMapList', () {
    final now = DateTime(2025, 1, 1, 12, 0);
    final notes = [
      Note(
        id: 1,
        title: 'A',
        content: 'a',
        pinned: false,
        createdAt: now,
        updatedAt: now,
        color: const Color(0x00000000),
      ),
      Note(
        id: 2,
        title: 'B',
        content: 'b',
        pinned: true,
        createdAt: now,
        updatedAt: now,
        color: const Color(0xFF2563EB),
      ),
    ];

    final maps = NoteMappers.toMapList(notes);
    final back = NoteMappers.fromIterable(maps);

    expect(back.length, notes.length);
    expect(back.first.title, notes.first.title);
    expect(back.last.pinned, notes.last.pinned);
  });
}
