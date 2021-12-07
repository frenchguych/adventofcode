import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/trip.dart';

void main() {
  test('> returns 2', () {
    expect(
      Trip(trip: '>').housesVisited,
      equals(2),
    );
  });

  test('^>v< return 4', () {
    expect(
      Trip(trip: '^>v<').housesVisited,
      equals(4),
    );
  });

  test('^v^v^v^v^v returns 2', () {
    expect(
      Trip(trip: '^v^v^v^v^v').housesVisited,
      equals(2),
    );
  });
}
