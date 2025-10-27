# Developer Guide

This document summarizes the core data model and utilities implemented for the notes app and provides quick commands to work with the project.

## Project Structure
- Flutter app root:
  `personal-notes-organizer-180681-180703/notes_frontend`

- Core files added:
  - lib/models/note.dart
    - Note model with fields: id, title, content, pinned, createdAt, updatedAt, color
    - Mapping helpers: toMap(), fromMap()
  - lib/utils/date_format.dart
    - Human-friendly timestamp formatting using intl

## Commands

From the Flutter app directory:

- Install dependencies:
  flutter pub get

- Run analyzer:
  flutter analyze

- Run tests:
  CI=true flutter test --no-pub

From the workspace root, use helper scripts:

- Run full CI sequence:
  bash personal-notes-organizer-180681-180703/ci.sh

- Run analyzer only:
  bash personal-notes-organizer-180681-180703/run_analyze.sh

- Alternative CI entry:
  bash personal-notes-organizer-180681-180703/run_flutter_ci.sh

## Notes

If CI or tools cannot detect the Flutter project root automatically, ensure commands are executed from:
personal-notes-organizer-180681-180703/notes_frontend

The pubspec.yaml in that directory defines the Flutter project.
