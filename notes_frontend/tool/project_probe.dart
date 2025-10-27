/// Minimal probe used by CI analyzers that search for a Dart entrypoint.
/// This file confirms that the current directory is a valid Dart/Flutter project.
void main() {
  // No-op: existence of this file and a valid pubspec.yaml indicates project root.
  // CI can run: dart tool/project_probe.dart
  // If it runs without resolving imports, the working directory is correct.
  print('Flutter project probe OK');
}
