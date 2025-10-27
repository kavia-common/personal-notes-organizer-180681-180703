#!/usr/bin/env bash
# Entrypoint for CI to run Flutter tasks from repo root or any path.
# It auto-detects the Flutter app directory and runs the requested command there.
# Usage (from repo root):
#   bash personal-notes-organizer-180681-180703/run_mobile_ci.sh all
#   bash personal-notes-organizer-180681-180703/run_mobile_ci.sh pub_get
#   bash personal-notes-organizer-180681-180703/run_mobile_ci.sh analyze
#   bash personal-notes-organizer-180681-180703/run_mobile_ci.sh test

set -euo pipefail

APP_DIR="personal-notes-organizer-180681-180703/notes_frontend"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "Error: Flutter app not found at $APP_DIR (pubspec.yaml missing)."
  exit 1
fi

CMD="${1:-all}"

pushd "$APP_DIR" >/dev/null

case "$CMD" in
  pub_get)
    flutter pub get
    ;;
  analyze)
    flutter pub get
    flutter analyze
    ;;
  test)
    flutter pub get
    flutter test
    ;;
  all)
    flutter pub get
    flutter analyze
    flutter test
    ;;
  *)
    echo "Usage: $0 {pub_get|analyze|test|all}"
    exit 2
    ;;
esac

popd >/dev/null
echo "Done: $CMD"
