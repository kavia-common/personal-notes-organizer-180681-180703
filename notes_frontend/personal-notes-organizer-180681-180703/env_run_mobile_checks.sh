#!/usr/bin/env bash
# CI helper that primes environment variables some analyzers rely on and runs checks in the app dir.

set -euo pipefail

# Hint path variables for tools that attempt auto-detection
export FLUTTER_PROJECT_DIR="personal-notes-organizer-180681-180703/notes_frontend"
export PUB_CACHE="${PUB_CACHE:-$HOME/.pub-cache}"

if [ ! -f "$FLUTTER_PROJECT_DIR/pubspec.yaml" ]; then
  echo "Error: pubspec.yaml not found under \$FLUTTER_PROJECT_DIR=$FLUTTER_PROJECT_DIR"
  exit 1
fi

echo "Using FLUTTER_PROJECT_DIR=$FLUTTER_PROJECT_DIR"
cd "$FLUTTER_PROJECT_DIR"

# Run standard checks
flutter pub get
flutter analyze
flutter test
