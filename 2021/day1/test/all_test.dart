import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/example.dart';
import '../lib/sonar.dart';

void main() {
  test('', () {
    expect(
      Sonar().part1(input),
      equals(7),
    );
  });

  test('', () {
    expect(
      Sonar().part2(input),
      equals(5),
    );
  });
}
