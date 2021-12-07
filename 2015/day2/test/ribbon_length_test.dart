import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/box.dart';

void main() {
  test('2x3x4 needs 34 feet of ribbon', () {
    expect(
      Box(w: 2, h: 3, l: 4).ribbonLength,
      equals(34),
    );
  });

  test('1x1x10 needs 14 feet of ribbon', () {
    expect(
      Box(w: 1, h: 1, l: 10).ribbonLength,
      equals(14),
    );
  });
}
