#!/usr/bin/env bash
# Container-local CI entry; guarantees running from the app directory.
set -euo pipefail

# Verify we're at the app root
if [ ! -f "pubspec.yaml" ] || [ ! -f "lib/main.dart" ]; then
  echo "This script must be run from personal-notes-organizer-180681-180703/notes_frontend"
  exit 2
fi

echo "Running flutter pub get..."
flutter pub get

echo "Running flutter analyze..."
flutter analyze

echo "Running flutter test..."
flutter test

echo "Container CI: Completed."
