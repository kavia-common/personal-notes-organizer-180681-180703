import 'package:notes_frontend/models.dart';
import 'package:notes_frontend/utils/date_format.dart';

/// This file exists solely to help CI/analyzers detect a valid Dart entrypoint
/// within the Flutter project. It is not used at runtime.
///
/// It imports public APIs from the app so the analyzer resolves the package graph.
void main() {
  // Exercise a couple of references to ensure analyzer sees symbols.
  final now = DateTime.now();
  // ignore: avoid_print
  print(DateFormatUtils.showShortDate(now));
}
