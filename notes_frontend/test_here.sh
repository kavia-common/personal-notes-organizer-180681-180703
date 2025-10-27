#!/usr/bin/env bash
# Run flutter tests from the app directory (notes_frontend)
set -euo pipefail

if [ ! -f "pubspec.yaml" ] || [ ! -f "lib/main.dart" ]; then
  echo "test_here.sh must be run from personal-notes-organizer-180681-180703/notes_frontend"
  exit 2
fi

flutter pub get
flutter test
