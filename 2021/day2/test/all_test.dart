import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/example.dart';
import '../lib/submarine.dart';

void main() {
  test('', () {
    expect(
      Submarine().part1(input),
      equals(150),
    );
  });

  test('', () {
    expect(
      Submarine().part2(input),
      equals(900),
    );
  });
}
