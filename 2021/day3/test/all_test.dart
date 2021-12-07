import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/diagnostic.dart';
import '../lib/example.dart';

void main() {
  test('', () {
    expect(
      Diagnostic(input).gamma,
      equals(22),
    );
  });

  test('', () {
    expect(
      Diagnostic(input).epsilon,
      equals(9),
    );
  });

  test('', () {
    expect(
      Diagnostic(input).oxygen,
      equals(23),
    );
  });

  test('', () {
    expect(
      Diagnostic(input).co2,
      equals(10),
    );
  });
}
