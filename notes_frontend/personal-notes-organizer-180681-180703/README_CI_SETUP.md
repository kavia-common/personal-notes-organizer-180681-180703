# Repository CI Setup for Flutter Mobile

Flutter app location:
- personal-notes-organizer-180681-180703/notes_frontend

Problem:
Some CI runners execute Flutter commands from the repository root, causing:
"Error: Could not determine project root directory for Flutter project"

Solution options (use any one):

1) Single command (recommended):
   bash personal-notes-organizer-180681-180703/run_all_mobile_checks.sh

2) Makefile target:
   make -C personal-notes-organizer-180681-180703 all

3) Auto-discovery wrapper:
   bash personal-notes-organizer-180681-180703/run_flutter_here.sh analyze
   bash personal-notes-organizer-180681-180703/run_flutter_here.sh test

4) Manual:
   cd personal-notes-organizer-180681-180703/notes_frontend
   flutter pub get
   flutter analyze
   flutter test

Diagnostics (optional):
- bash personal-notes-organizer-180681-180703/diagnose_flutter_env.sh
- echo "$(bash personal-notes-organizer-180681-180703/notes_frontend/tool/print_app_path.sh)"
