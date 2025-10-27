import 'package:flutter_test/flutter_test.dart';
import 'package:notes_frontend/utils/date_format.dart';

void main() {
  test('showShortDate formats a known date', () {
    final dt = DateTime(2025, 3, 5, 15, 45);
    final out = DateFormatUtils.showShortDate(dt);
    expect(out.isNotEmpty, true);
  });

  test('showTime formats a known time', () {
    final dt = DateTime(2025, 3, 5, 15, 45);
    final out = DateFormatUtils.showTime(dt);
    expect(out.isNotEmpty, true);
  });

  test('showFullDateTime combines date and time', () {
    final dt = DateTime(2025, 3, 5, 15, 45);
    final out = DateFormatUtils.showFullDateTime(dt);
    expect(out.isNotEmpty, true);
  });

  test('showRelative handles seconds/minutes/hours/days', () {
    final now = DateTime(2025, 3, 5, 12, 0);
    expect(DateFormatUtils.showRelative(now, now: now), anyOf(['Just now', '0s ago']));
    expect(DateFormatUtils.showRelative(now.subtract(const Duration(seconds: 30)), now: now), isNotEmpty);
    expect(DateFormatUtils.showRelative(now.subtract(const Duration(minutes: 2)), now: now), contains('min'));
    expect(DateFormatUtils.showRelative(now.subtract(const Duration(hours: 3)), now: now), contains('h'));
    expect(DateFormatUtils.showRelative(now.subtract(const Duration(days: 2)), now: now), anyOf([contains('days'), 'Yesterday']));
  });
}
