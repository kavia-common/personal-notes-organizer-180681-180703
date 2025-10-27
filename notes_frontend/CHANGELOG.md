# Changelog

## 0.1.0
- Added Note data model with:
  - id, title, content, pinned, createdAt, updatedAt, color
  - toMap/fromMap (SQLite-friendly), toJson/fromJson
  - canonical key constants
- Added DateFormatUtils (intl-backed) for human-friendly timestamps
- Added DB constants (note_db_constants.dart) and NoteMapper
- Added ColorUtils for robust dynamic-to-Color parsing
- Added models/utils barrel exports
- Added in-memory NoteRepository and NotesState for early UI wiring
- Added CI analyzer shims to proceed without full Flutter toolchain
