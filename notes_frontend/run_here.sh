#!/usr/bin/env bash
# Run Flutter checks from the app directory (this file lives inside the app).
set -euo pipefail

if [ ! -f "pubspec.yaml" ] || [ ! -f "lib/main.dart" ]; then
  echo "This script must be run from notes_frontend directory."
  exit 2
fi

flutter pub get
flutter analyze
flutter test
