import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/crabs.dart';
import '../lib/example.dart';

void main() {
  test('', () {
    expect(
      Crabs(input).part1,
      equals(37),
    );
  });

  test('', () {
    expect(
      Crabs(input).part2,
      equals(168),
    );
  });
}
