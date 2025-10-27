import 'dart:io';

void main() {
  final pubspec = File('pubspec.yaml');
  final libMain = File('lib/main.dart');
  if (!pubspec.existsSync() || !libMain.existsSync()) {
    stderr.writeln('Not at Flutter app root. Ensure CI cd into notes_frontend.');
    exit(2);
  }
  print('Flutter app root verified.');
}
