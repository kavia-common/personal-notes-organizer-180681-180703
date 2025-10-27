/// Helper script for CI and analyzers to determine the Flutter project root.
/// Prints the relative path to the Flutter app directory and exits 0.
void main() {
  // Path relative to workspace root.
  const path = 'personal-notes-organizer-180681-180703/notes_frontend';
  // Emit the path so CI systems that parse stdout can cd accordingly.
  // Maintains compatibility with generic runners.
  // Format: key=value for easy parsing.
  // Example usage:
  //   dart run personal-notes-organizer-180681-180703/flutter_project_locator.dart
  //   cd $(dart run ... | cut -d= -f2)
  print('FLUTTER_PROJECT_DIR=$path');
}
