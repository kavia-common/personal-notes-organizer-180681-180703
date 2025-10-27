# CI Setup

From repository root, prefer one of:
- bash personal-notes-organizer-180681-180703/run_all_ci.sh
- dart run personal-notes-organizer-180681-180703/run_ci.dart

If your CI requires executable permissions, ensure:
- chmod +x personal-notes-organizer-180681-180703/run_all_ci.sh
- chmod +x personal-notes-organizer-180681-180703/run_flutter_ci.sh

Working directory must be:
- personal-notes-organizer-180681-180703/notes_frontend

Then run:
- flutter pub get
- flutter analyze
- flutter test --coverage
