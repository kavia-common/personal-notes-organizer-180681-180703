#!/usr/bin/env bash
# Finds the Flutter app directory by searching for a pubspec.yaml that looks like a Flutter app.
# Prints the relative path from repo root if found; exits non-zero otherwise.

set -euo pipefail

# Search depth limited for performance; adjust if the tree is deeper.
CANDIDATES=$(find . -maxdepth 4 -type f -name pubspec.yaml | sort)

for f in $CANDIDATES; do
  # Heuristic: file contains "sdk: flutter" under dependencies
  if grep -qE '(^|\s)sdk:\s*flutter' "$f"; then
    APP_DIR="$(dirname "$f")"
    # Further ensure it's our intended app by checking the presence of lib/main.dart
    if [ -f "$APP_DIR/lib/main.dart" ]; then
      # Print path without leading ./ for convenience
      CLEAN="${APP_DIR#./}"
      echo "$CLEAN"
      exit 0
    fi
  fi
done

echo "Error: Could not locate Flutter app directory with pubspec.yaml and lib/main.dart" >&2
exit 1
