import 'package:flutter_test/flutter_test.dart';
import 'package:notes_frontend/models/note.dart';
import 'package:notes_frontend/models/note_search.dart';
import 'package:flutter/material.dart';

void main() {
  test('NoteSearch.filter matches title and content, case-insensitive', () {
    final now = DateTime(2025, 1, 1, 12, 0);
    final items = <Note>[
      Note(
        id: 1,
        title: 'Groceries',
        content: 'Buy milk and eggs',
        pinned: false,
        createdAt: now,
        updatedAt: now,
        color: const Color(0x00000000),
      ),
      Note(
        id: 2,
        title: 'Workout',
        content: 'Leg day routine',
        pinned: true,
        createdAt: now,
        updatedAt: now,
        color: const Color(0xFF2563EB),
      ),
      Note(
        id: 3,
        title: 'Travel Plans',
        content: 'Book flights to Berlin',
        pinned: false,
        createdAt: now,
        updatedAt: now,
        color: const Color(0xFFF59E0B),
      ),
    ];

    // Empty query returns all
    expect(NoteSearch.filter(items, '').length, items.length);

    // Match by title
    final r1 = NoteSearch.filter(items, 'grocer');
    expect(r1.length, 1);
    expect(r1.first.title, 'Groceries');

    // Match by content (case-insensitive)
    final r2 = NoteSearch.filter(items, 'LEG');
    expect(r2.length, 1);
    expect(r2.first.title, 'Workout');

    // No matches
    final r3 = NoteSearch.filter(items, 'not-here');
    expect(r3.isEmpty, true);
  });
}
