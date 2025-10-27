# CI Guidance for Flutter Mobile Project

The Flutter app lives at:
- personal-notes-organizer-180681-180703/notes_frontend

Many CI environments run commands from the repository root, which leads to:
"Error: Could not determine project root directory for Flutter project"

To fix this, ensure all Flutter commands are executed from the app directory.
Two supported options:

1) Use the provided repo-root script:
   bash personal-notes-organizer-180681-180703/run_mobile_ci.sh all

2) Or cd into the app directory before running commands:
   cd personal-notes-organizer-180681-180703/notes_frontend
   flutter pub get
   flutter analyze
   flutter test

Additional helpers:
- App-local script: personal-notes-organizer-180681-180703/notes_frontend/tool/ci_run.sh
- Dart-based runner (run from the app directory): dart tool/ci_runner.dart all

If CI must auto-discover the app path, read:
- personal-notes-organizer-180681-180703/.flutter_project_path
which contains: notes_frontend
