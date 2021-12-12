import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/example.dart';
import '../lib/syntax_checker.dart';

void main() {
  test(
    '',
    () {
      expect(
        SyntaxChecker(input).part1,
        equals(26397),
      );
    },
  );

  test(
    '',
    () {
      expect(
        SyntaxChecker(input).part2,
        equals(288957),
      );
    },
  );
}
