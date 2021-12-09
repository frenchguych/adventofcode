import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/example.dart';
import '../lib/string_checker.dart';

void main() {
  test('', () {
    expect(StringChecker(input).part1, equals(2));
  });
}
