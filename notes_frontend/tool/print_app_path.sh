#!/usr/bin/env bash
# Prints the absolute path of the Flutter app directory for CI convenience.
# Usage:
#   APP_PATH=$(bash personal-notes-organizer-180681-180703/notes_frontend/tool/print_app_path.sh)
#   cd "$APP_PATH" && flutter pub get && flutter analyze && flutter test

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
echo "$APP_DIR"
