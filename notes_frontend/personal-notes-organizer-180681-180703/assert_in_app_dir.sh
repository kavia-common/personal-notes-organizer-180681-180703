#!/usr/bin/env bash
# Fails if not executed within the Flutter app directory. Useful to make CI fail early with a clear message.
set -euo pipefail

if [ ! -f "pubspec.yaml" ] || [ ! -d "lib" ] || [ ! -f "lib/main.dart" ]; then
  echo "Not at a Flutter app root. Please cd into personal-notes-organizer-180681-180703/notes_frontend"
  exit 3
fi

echo "At Flutter app root."
