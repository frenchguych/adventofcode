import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/example.dart';
import '../lib/model.dart';

void main() {
  test('test small lines in correct orientation', () {
    expect(
      Grid(lines: [
        Line(
          start: Point(x: 3, y: 1),
          end: Point(x: 5, y: 1),
        ),
        Line(
          start: Point(x: 3, y: 0),
          end: Point(x: 5, y: 2),
        ),
      ]).compute(useDiagonals: true),
      equals(1),
    );
  });

  test('test part1', () {
    expect(
      Grid(lines: lines).compute(useDiagonals: true),
      equals(12),
    );
  });
}
