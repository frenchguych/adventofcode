import 'package:test/expect.dart';
import 'package:test/test.dart';

import '../lib/example.dart';
import '../lib/paper.dart';

void main() {
  test(
    '',
    () {
      var paper = Paper(
        [
          [0, 0]
        ],
      );
      var count = paper.count();
      expect(
        count,
        equals(1),
      );
    },
  );

  test(
    '',
    () {
      var paper = Paper(
        [
          [0, 0],
          [10, 10]
        ],
      );
      var count = paper.count();
      expect(
        count,
        equals(2),
      );
    },
  );

  test(
    '',
    () {
      var paper = Paper(input);
      expect(
        paper.count(),
        equals(18),
      );
    },
  );

  test(
    '',
    () {
      var paper = Paper([
        [0, 0],
        [1, 1],
        [2, 2],
        [3, 4]
      ]);
      paper.printGrid();
      expect(paper.maxX, equals(3));
      expect(paper.maxY, equals(4));
      paper.fold('y', 3);
      var foldedGrid = paper.foldedGrid();
      expect(foldedGrid.length, equals(4));
      expect(foldedGrid[0].length, equals(3));
      expect(
          foldedGrid,
          equals([
            [1, 0, 0],
            [0, 1, 0],
            [0, 0, 1],
            [0, 0, 1],
          ]));
    },
  );

  test(
    '',
    () {
      var paper = Paper(input);
      paper.fold('y', 7);
      paper.printGrid();
      expect(
        paper.count(),
        equals(17),
      );
    },
  );

  test(
    '',
    () {
      var paper = Paper([
        [0, 0],
        [1, 1],
        [2, 2],
        [4, 3]
      ]);
      paper.printGrid();
      print("");
      paper.fold('x', 3);
      var foldedGrid = paper.foldedGrid();
      paper.printGrid();
      expect(foldedGrid.length, equals(3));
      expect(foldedGrid[0].length, equals(4));
      expect(
          foldedGrid,
          equals([
            [1, 0, 0, 0],
            [0, 1, 0, 0],
            [0, 0, 1, 1],
          ]));
    },
  );
}
