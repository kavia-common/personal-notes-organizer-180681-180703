#!/usr/bin/env bash
# Prints environment diagnostics to help troubleshoot CI root detection issues.

set -euo pipefail

echo "PWD: $(pwd)"
echo "Repo contents:"
ls -la

echo
echo "Attempting to locate Flutter app via find script..."
if bash personal-notes-organizer-180681-180703/find_flutter_app_dir.sh >/dev/null 2>&1; then
  APP_DIR="$(bash personal-notes-organizer-180681-180703/find_flutter_app_dir.sh)"
  echo "Found Flutter app at: $APP_DIR"
else
  echo "Could not find Flutter app with find script."
fi

echo
echo "Flutter doctor:"
if command -v flutter >/dev/null 2>&1; then
  flutter --version || true
  flutter doctor -v || true
else
  echo "flutter command not found in PATH"
fi

echo
echo "Dart version:"
if command -v dart >/dev/null 2>&1; then
  dart --version || true
else
  echo "dart command not found in PATH"
fi

echo
echo "Pubspecs detected (up to depth 4):"
find . -maxdepth 4 -type f -name pubspec.yaml -print
