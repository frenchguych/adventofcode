import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/trip.dart';

void main() {
  test('^v returns 3', () {
    expect(
      Trip(trip: '^v').housesVisitedWithRobot,
      equals(3),
    );
  });

  test('^>v< returns 3', () {
    expect(
      Trip(trip: '^>v<').housesVisitedWithRobot,
      equals(3),
    );
  });

  test('^v^v^v^v^v returns 11', () {
    expect(
      Trip(trip: '^v^v^v^v^v').housesVisitedWithRobot,
      equals(11),
    );
  });
}
