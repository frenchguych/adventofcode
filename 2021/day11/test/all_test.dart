import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/example.dart';
import '../lib/grid.dart';

void main() {
  test(
    '',
    () {
      expect(
        Grid().step(input, steps: 100),
        equals(1656),
      );
    },
  );

  test(
    '',
    () {
      expect(
        Grid().syncStep(input),
        equals(195),
      );
    },
  );
}
