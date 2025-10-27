#!/usr/bin/env bash
# Generic CI helper to run any flutter subcommand in the app directory.
# Example:
#   bash personal-notes-organizer-180681-180703/flutter_ci.sh pub get
#   bash personal-notes-organizer-180681-180703/flutter_ci.sh analyze
#   bash personal-notes-organizer-180681-180703/flutter_ci.sh test

set -euo pipefail
APP_DIR="personal-notes-organizer-180681-180703/notes_frontend"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "Error: pubspec.yaml not found at $APP_DIR"
  exit 1
fi

pushd "$APP_DIR" >/dev/null
flutter "$@"
popd >/dev/null
