# SQLite Migrations

This folder contains SQL migrations for the local SQLite database.

Current migrations:
- 001_create_notes.sql
  - Creates the `notes` table with columns:
    - id INTEGER PRIMARY KEY AUTOINCREMENT
    - title TEXT NOT NULL
    - content TEXT NOT NULL
    - pinned INTEGER NOT NULL DEFAULT 0
    - created_at TEXT NOT NULL (ISO 8601)
    - updated_at TEXT NOT NULL (ISO 8601)
    - color INTEGER NOT NULL DEFAULT 0 (ARGB)

Indexes:
- idx_notes_pinned_updated on (pinned DESC, updated_at DESC)

Model alignment:
- Mirrors lib/models/note.dart fields and toMap/fromMap keys.
- Constants in lib/models/note_db_constants.dart and lib/models/note_sql.dart.
