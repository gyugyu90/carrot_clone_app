import 'package:carrot_clone_app/extensions/date_time_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('time ago', () {
    expect(DateTime.now().add(const Duration(seconds: -5)).timeAgo(), '5초 전');
    expect(DateTime.now().add(const Duration(seconds: -125)).timeAgo(), '2분 전');
    expect(DateTime.now().add(const Duration(minutes: -65)).timeAgo(), '1시간 전');
    expect(DateTime.now().add(const Duration(hours: -74)).timeAgo(), '3일 전');
    expect(DateTime.now().add(const Duration(days: -130)).timeAgo(), '4개월 전');
    expect(DateTime.now().add(const Duration(days: -750)).timeAgo(), '2년 전');
  });
}
