import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/grid.dart';

Map<int, int> list2map(List<int> list) {
  var map = <int, int>{};

  for (var i in list) {
    map[i] = (map[i] ?? 0) + 1;
  }

  return map;
}

void main() {
  test('', () {
    expect(
      list2map([2, 3, 2, 0, 1]),
      equals({0: 1, 1: 1, 2: 2, 3: 1}),
    );
  });

  test('', () {
    expect(
      list2map([1, 2, 1, 6, 0, 8]),
      equals({1: 2, 2: 1, 6: 1, 0: 1, 8: 1}),
    );
  });

  test('', () {
    expect(
      Grid([3, 4, 3, 1, 2]).data,
      equals({1: 1, 2: 1, 3: 2, 4: 1}),
    );
  });

  test('', () {
    expect(
      (Grid([3, 4, 3, 1, 2])..evolve(1)).data,
      equals({0: 1, 1: 1, 2: 2, 3: 1}),
    );
  });

  test('', () {
    expect(
      (Grid([3, 4, 3, 1, 2])..evolve(2)).data,
      equals(list2map([1, 2, 1, 6, 0, 8])), //1,2,1,6,0,8
    );
  });

  test('', () {
    expect(
      (Grid([3, 4, 3, 1, 2])..evolve(3)).data,
      equals(list2map([0, 1, 0, 5, 6, 7, 8])), //0,1,0,5,6,7,8
    );
  });

  test('', () {
    expect(
      (Grid([3, 4, 3, 1, 2])..evolve(4)).data,
      equals(list2map([6, 0, 6, 4, 5, 6, 7, 8, 8])), //6,0,6,4,5,6,7,8,8
    );
  });

  test('', () {
    expect(
      (Grid([3, 4, 3, 1, 2])..evolve(18)).data,
      equals(list2map([
        6,
        0,
        6,
        4,
        5,
        6,
        0,
        1,
        1,
        2,
        6,
        0,
        1,
        1,
        1,
        2,
        2,
        3,
        3,
        4,
        6,
        7,
        8,
        8,
        8,
        8
      ])), //6,0,6,4,5,6,7,8,8
    );
  });

  test('', () {
    expect(
      (Grid([3, 4, 3, 1, 2])..evolve(80)).result,
      equals(5934), //6,0,6,4,5,6,7,8,8
    );
  });
}

