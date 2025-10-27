#!/usr/bin/env bash
# Wrapper to run a flutter subcommand inside the discovered Flutter app directory.
# Examples:
#   bash personal-notes-organizer-180681-180703/run_flutter_here.sh pub get
#   bash personal-notes-organizer-180681-180703/run_flutter_here.sh analyze
#   bash personal-notes-organizer-180681-180703/run_flutter_here.sh test

set -euo pipefail

ROOT_DIR="personal-notes-organizer-180681-180703"
FIND_SCRIPT="$ROOT_DIR/find_flutter_app_dir.sh"

if [ ! -f "$FIND_SCRIPT" ]; then
  echo "Error: $FIND_SCRIPT not found"
  exit 1
fi

APP_DIR="$(bash "$FIND_SCRIPT")"
if [ -z "$APP_DIR" ]; then
  echo "Error: could not determine Flutter app directory"
  exit 1
fi

echo "Discovered Flutter app at: $APP_DIR"
pushd "$APP_DIR" >/dev/null
flutter "$@"
popd >/dev/null
