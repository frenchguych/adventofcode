import 'package:characters/characters.dart';

class Position {
  final int x;
  final int y;

  Position({required this.x, required this.y}) : hashCode = x * 10000000 + y;

  operator ==(other) {
    var o = other as Position;
    return (this.x == o.x && this.y == o.y);
  }

  final int hashCode;
}

class Trip {
  final String trip;

  Trip({required this.trip});

  int get housesVisited {
    var position = Position(x: 0, y: 0);
    Set<Position> visitedPositions = Set<Position>()..add(position);

    for (var move in trip.characters) {
      switch (move) {
        case "^":
          position = Position(x: position.x, y: position.y - 1);
          break;
        case ">":
          position = Position(x: position.x + 1, y: position.y);
          break;
        case "v":
          position = Position(x: position.x, y: position.y + 1);
          break;
        case "<":
          position = Position(x: position.x - 1, y: position.y);
          break;
      }
      visitedPositions.add(position);
    }

    return visitedPositions.length;
  }

  int get housesVisitedWithRobot {
    var santaPosition = Position(x: 0, y: 0);
    var robotPosition = Position(x: 0, y: 0);
    Set<Position> santaPositions = Set<Position>()..add(santaPosition);
    Set<Position> robotPositions = Set<Position>()..add(robotPosition);
    bool santaMoving = true;

    for (var move in trip.characters) {
      switch (move) {
        case "^":
          if (santaMoving) {
            santaPosition =
                Position(x: santaPosition.x, y: santaPosition.y - 1);
          } else {
            robotPosition =
                Position(x: robotPosition.x, y: robotPosition.y - 1);
          }
          break;
        case ">":
          if (santaMoving) {
            santaPosition =
                Position(x: santaPosition.x + 1, y: santaPosition.y);
          } else {
            robotPosition =
                Position(x: robotPosition.x + 1, y: robotPosition.y);
          }
          break;
        case "v":
          if (santaMoving) {
            santaPosition =
                Position(x: santaPosition.x, y: santaPosition.y + 1);
          } else {
            robotPosition =
                Position(x: robotPosition.x, y: robotPosition.y + 1);
          }
          break;
        case "<":
          if (santaMoving) {
            santaPosition =
                Position(x: santaPosition.x - 1, y: santaPosition.y);
          } else {
            robotPosition =
                Position(x: robotPosition.x - 1, y: robotPosition.y);
          }
          break;
      }

      if (santaMoving) {
        santaPositions.add(santaPosition);
      } else {
        robotPositions.add(robotPosition);
      }

      santaMoving = !santaMoving;
    }

    return santaPositions.length +
        robotPositions.length -
        santaPositions.intersection(robotPositions).length;
  }
}
