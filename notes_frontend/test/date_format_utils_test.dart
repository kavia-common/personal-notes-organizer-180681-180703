import 'package:notes_frontend/utils/date_format.dart';

void main() {
  final base = DateTime(2025, 1, 2, 12, 0, 0);

  // Just now
  assert(DateFormatUtils.showRelative(base, now: base) == 'Just now');

  // Minutes ago
  final fiveMinAgo = base.subtract(const Duration(minutes: 5));
  assert(DateFormatUtils.showRelative(fiveMinAgo, now: base).contains('min'));

  // Hours ago
  final twoHours = base.subtract(const Duration(hours: 2));
  assert(DateFormatUtils.showRelative(twoHours, now: base).contains('h'));

  // Yesterday
  final yesterday = DateTime(2025, 1, 1, 23, 59, 0);
  assert(DateFormatUtils.showRelative(yesterday, now: base) == 'Yesterday');
}
