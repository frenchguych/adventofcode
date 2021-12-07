import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/box.dart';

void main() {
  test('2x3x4 returns 58', () {
    expect(
      Box(w: 2, h: 3, l: 4).surfaceToOrder,
      equals(58),
    );
  });

  test('1x1x10 returns 43', () {
    expect(
      Box(w: 1, h: 1, l: 10).surfaceToOrder,
      equals(43),
    );
  });
}
