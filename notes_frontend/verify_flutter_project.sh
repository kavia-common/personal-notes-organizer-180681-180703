#!/usr/bin/env bash
set -euo pipefail

EXPECTED_PATH="personal-notes-organizer-180681-180703/notes_frontend"
if [ -f "$EXPECTED_PATH/pubspec.yaml" ]; then
  echo "[verify] OK: Found Flutter project at $EXPECTED_PATH"
  exit 0
else
  echo "[verify] ERROR: Flutter project not found at $EXPECTED_PATH"
  echo "[verify] Tip: cd $EXPECTED_PATH before running flutter commands."
  exit 2
fi
