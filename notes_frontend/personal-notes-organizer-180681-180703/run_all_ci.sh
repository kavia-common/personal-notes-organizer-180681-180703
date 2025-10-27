#!/usr/bin/env bash
# Wrapper that runs Flutter CI steps from the correct project directory.
set -euo pipefail

APP_DIR="personal-notes-organizer-180681-180703/notes_frontend"

echo "Switching to Flutter app directory: $APP_DIR"
cd "$APP_DIR"

echo "Running flutter --version"
flutter --version

echo "Running flutter pub get"
flutter pub get

echo "Running flutter analyze"
flutter analyze

echo "Running flutter test --coverage"
CI=true flutter test --coverage

echo "All CI steps completed successfully from $APP_DIR"
