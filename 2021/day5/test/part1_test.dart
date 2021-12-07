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
          end: Point(x: 4, y: 1),
        ),
        Line(
          start: Point(x: 3, y: 1),
          end: Point(x: 3, y: 2),
        ),
      ]).compute(),
      equals(1),
    );
  });

  test('test small lines in reverse orientation', () {
    expect(
      Grid(lines: [
        Line(
          start: Point(x: 2, y: 1),
          end: Point(x: 1, y: 1),
        ),
        Line(
          start: Point(x: 1, y: 2),
          end: Point(x: 1, y: 1),
        ),
      ]).compute(),
      equals(1),
    );
  });

  test('test part1', () {
    expect(
      Grid(lines: lines).compute(),
      equals(5),
    );
  });
}
