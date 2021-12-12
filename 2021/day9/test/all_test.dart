import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/example.dart';
import '../lib/grid.dart';

void main() {
  test(
    '',
    () {
      expect(
        Grid(input).part1,
        equals(15),
      );
    },
  );

  test(
    '',
    () {
      expect(
        Grid(input).part2,
        equals(1134),
      );
    },
  );
}
