#!/usr/bin/env bash
# Fails with a clear message if not executed within the Flutter app directory.
set -euo pipefail

APP_DIR="personal-notes-organizer-180681-180703/notes_frontend"

if [ -f "pubspec.yaml" ] && [ -f "lib/main.dart" ]; then
  echo "You are at a Flutter app root. Proceed."
  exit 0
fi

echo "ERROR: Flutter commands must run from: $APP_DIR"
echo "Hint:"
echo "  cd $APP_DIR && flutter pub get && flutter analyze && flutter test"
echo "Or use:"
echo "  bash personal-notes-organizer-180681-180703/run_all_mobile_checks.sh"
exit 10
