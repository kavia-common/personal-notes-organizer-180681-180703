#!/usr/bin/env bash
# Simple non-interactive helper to run Flutter commands from CI regardless of CWD.
# Usage examples (from repo root or any dir):
#   bash personal-notes-organizer-180681-180703/notes_frontend/tool/ci_run.sh pub_get
#   bash personal-notes-organizer-180681-180703/notes_frontend/tool/ci_run.sh analyze
#   bash personal-notes-organizer-180681-180703/notes_frontend/tool/ci_run.sh test
#   bash personal-notes-organizer-180681-180703/notes_frontend/tool/ci_run.sh format_check

set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cmd="${1:-help}"

pushd "$APP_DIR" > /dev/null

case "$cmd" in
  pub_get)
    flutter pub get
    ;;
  analyze)
    flutter analyze
    ;;
  test)
    # Ensure tests run in CI-friendly mode
    flutter test --no-pub
    ;;
  format_check)
    # Check formatting without changing files (returns non-zero if formatting needed)
    dart format --output=none --set-exit-if-changed .
    ;;
  all)
    flutter pub get
    flutter analyze
    flutter test --no-pub
    ;;
  *)
    echo "Usage: $0 {pub_get|analyze|test|format_check|all}"
    exit 2
    ;;
esac

popd > /dev/null
