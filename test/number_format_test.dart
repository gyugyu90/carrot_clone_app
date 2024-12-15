import 'package:carrot_clone_app/extensions/int_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('with comma', () {
    expect(1000.withComma(), '1,000');
    expect(880.withComma(), '880');
    expect(2000000.withComma(), '2,000,000');
  });
}
