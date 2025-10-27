import 'package:flutter_test/flutter_test.dart';
import 'package:notes_frontend/utils/date_format.dart';

void main() {
  test('DateFormatUtils basic smoke', () {
    final now = DateTime(2025, 1, 1, 12, 30);
    expect(DateFormatUtils.showShortDate(now).isNotEmpty, true);
    expect(DateFormatUtils.showTime(now).isNotEmpty, true);
    expect(DateFormatUtils.showFullDateTime(now).isNotEmpty, true);
    expect(DateFormatUtils.showRelative(now, now: now).isNotEmpty, true);
  });
}
