import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/example.dart';
import '../lib/display.dart';

void main() {
  test('', () {
    expect(Display(input).part1, equals(26));
  });

  test('', () {
    expect(Display(input).part2, equals(61229));
  });

  test('', () {
    expect(
        Display([
          [
            [
              "abcefg",
              "cf",
              "acdeg",
              "acdfg",
              "bcdf",
              "abdfg",
              "abdefg",
              "acf",
              "abcdefg",
              "abcdfg"
            ],
            ["abcefg", "abcefg", "abcefg", "cf"]
          ]
        ]).part2,
        equals(1));
  });
}
