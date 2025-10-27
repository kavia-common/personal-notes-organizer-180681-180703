# Contributing / CI Notes

This workspace contains a Flutter app located at:
- personal-notes-organizer-180681-180703/notes_frontend

Run Flutter commands from that directory:

1) Install dependencies
   flutter pub get

2) Analyze
   flutter analyze

3) Test
   CI=true flutter test --no-pub

Helper scripts from workspace root:
- bash personal-notes-organizer-180681-180703/ci.sh
- bash personal-notes-organizer-180681-180703/analyze.sh
- bash personal-notes-organizer-180681-180703/test.sh
