#!/usr/bin/env bash
# Forward any flutter subcommand into the correct Flutter app directory.
# Usage examples:
#   ./flutter.sh pub get
#   ./flutter.sh analyze
#   ./flutter.sh test
set -euo pipefail

APP_DIR="personal-notes-organizer-180681-180703/notes_frontend"

if [ ! -f "$APP_DIR/pubspec.yaml" ] || [ ! -f "$APP_DIR/lib/main.dart" ]; then
  echo "flutter.sh: Flutter app not found at $APP_DIR"
  exit 1
fi

cd "$APP_DIR"
flutter "$@"
