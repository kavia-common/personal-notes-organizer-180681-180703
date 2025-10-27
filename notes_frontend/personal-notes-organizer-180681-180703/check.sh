#!/usr/bin/env bash
# Quick CI check: ensure we are analyzing the correct Flutter app directory.
set -euo pipefail

APP_DIR="personal-notes-organizer-180681-180703/notes_frontend"

echo "check.sh: cd to $APP_DIR"
cd "$APP_DIR"

echo "check.sh: flutter pub get"
flutter pub get

echo "check.sh: flutter analyze (quick)"
flutter analyze
