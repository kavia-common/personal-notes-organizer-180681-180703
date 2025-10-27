# Developer Guide: Models and Utils

This guide covers the core data models and utilities added to unblock DB and UI layers.

## Models
- Note (lib/models/note.dart)
  - Fields: id, title, content, pinned, createdAt, updatedAt, color
  - Helpers:
    - toMap/fromMap (SQLite-friendly)
    - toJson/fromJson (API/backup)
    - copyWith
    - canonical map key constants (kId, kTitle, ...)
- NoteTable (lib/models/note_db_constants.dart)
  - Table and column constants, CREATE TABLE SQL
- NoteMapper (lib/models/note_mapper.dart)
  - Converts between DB row maps and Note
- NoteRepository (lib/models/note_repository.dart)
  - CRUD/search contract for persistence
- InMemoryNoteRepository (lib/models/note_repository_memory.dart)
  - Temporary in-memory implementation for early UI wiring
- NotesState (lib/models/notes_state.dart)
  - Provider-based state with refresh/add/update/remove/search
- Extensions (lib/models/note_extensions.dart)
  - Sorting and search helpers for List<Note>

Barrel export: import 'package:notes_frontend/models/models.dart';

## Utils
- DateFormatUtils (lib/utils/date_format.dart)
  - Human-friendly timestamps: showRelative, showShortDate, showTime, showFullDateTime
- ColorUtils (lib/utils/color_utils.dart)
  - Safe dynamic-to-Color parsing
- Clock (lib/utils/clock.dart)
  - Testable DateTime.now()
- RoutePaths (lib/utils/route_paths.dart)
  - Centralized route names

Barrel export: import 'package:notes_frontend/utils/utils.dart';

## DB Migration
- assets/migrations/001_create_notes.sql
  - Initial notes table schema aligned with Note model

## Notes
- CI shims exist under lib/_ci_stubs to keep static analysis passing in limited toolchain environments. They are not used at runtime.
- Replace InMemoryNoteRepository with a SQLite-backed implementation later.
