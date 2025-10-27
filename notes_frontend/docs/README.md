# Documentation Index

This app includes foundational code to unblock DB and UI layers:

- DEV_GUIDE_MODELS_UTILS.md: Developer guide for models and utilities
- Migrations
  - assets/migrations/README.md
  - assets/migrations/001_create_notes.sql
- Library overviews
  - lib/README.md
  - lib/models/README_PACKAGE.md
  - lib/utils/README_PACKAGE.md
- Date utilities
  - lib/utils/DATE_FORMAT_README.md

Key modules:
- Models: lib/models/
  - Note (toMap/fromMap/JSON, copyWith)
  - NoteTable/NoteSql (schema constants), NoteMapper
  - NoteRepository (contract), InMemoryNoteRepository
  - NotesState (provider-style state)
  - Helpers: NoteFactory, NoteListX, NoteSeed
- Utils: lib/utils/
  - DateFormatUtils (human-friendly timestamps)
  - ColorUtils, Clock, NoteColors, MigrationLoader
  - RoutePaths
