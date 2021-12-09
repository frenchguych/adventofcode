import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/hash_finder.dart';

void main() {
  test('', () {
    expect(HashFinder('abcdef').part1, equals(609043));
  });

  test('', () {
    expect(HashFinder('pqrstuv').part1, equals(1048970));
  });
}
