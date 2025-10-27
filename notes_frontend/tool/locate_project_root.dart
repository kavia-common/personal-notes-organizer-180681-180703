/// Prints the absolute path to this Flutter project's root directory.
/// Usage:
///   dart run tool/locate_project_root.dart
import 'dart:io';

void main() {
  final dir = Directory.current.path;
  // Ensure this file is executed from project root or via `-C` like behavior.
  // If run from elsewhere via `dart run`, resolve to the script's directory.
  final scriptDir = File.fromUri(Platform.script).parent.parent.path;
  // Prefer the script's parent (the project root), fallback to current working dir.
  final projectRoot = Directory(scriptDir).absolute.path;
  print(projectRoot);
}
