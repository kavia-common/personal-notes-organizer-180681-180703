# CI Run Notes

To avoid "Could not determine project root directory for Flutter project", ensure CI steps use this folder as the working directory:

- Working directory: `personal-notes-organizer-180681-180703/notes_frontend`

Recommended steps:
1. flutter --version
2. flutter pub get
3. flutter analyze
4. flutter test --machine --coverage

Notes:
- This file is for CI orchestration and local developer reference only.
- The Flutter project root is this directory (contains pubspec.yaml).
