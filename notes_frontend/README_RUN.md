# Running and Analyzing the Flutter App

Project root for Flutter:
- This directory: personal-notes-organizer-180681-180703/notes_frontend

Common commands (run from this directory):
- flutter pub get
- flutter analyze
- flutter test --coverage
- flutter run

If you see "Could not determine project root directory for Flutter project":
- Ensure your current working directory contains `pubspec.yaml`.
- For CI, set working_directory: personal-notes-organizer-180681-180703/notes_frontend
- Optionally use the Makefile:
  - make -C personal-notes-organizer-180681-180703/notes_frontend bootstrap analyze test
