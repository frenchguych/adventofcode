class Point {
  final int x;
  final int y;
  final int hashCode;

  Point({
    required this.x,
    required this.y,
  }) : hashCode = x * 10000000 + y;

  operator ==(other) {
    var p = other as Point;
    return x == p.x && y == p.y;
  }
}

class Line {
  final Point start;
  final Point end;

  Line({
    required this.start,
    required this.end,
  });

  bool get straight => start.x == end.x || start.y == end.y;

  List<Point> points() {
    var value = <Point>[];
    if (start.y == end.y) {
      var delta = (end.x - start.x);
      for (var x = 0; x <= delta.abs(); x++) {
        value.add(Point(x: start.x + x * delta.sign, y: start.y));
      }
    } else if (start.x == end.x) {
      var delta = (end.y - start.y);
      for (var y = 0; y <= delta.abs(); y++) {
        value.add(Point(x: start.x, y: start.y + y * delta.sign));
      }
    } else {
      var deltax = (end.x - start.x);
      var deltay = (end.y - start.y);
      for (var y = 0; y <= deltay.abs(); y++) {
        value.add(
            Point(x: start.x + y * deltax.sign, y: start.y + y * deltay.sign));
      }
    }
    return value;
  }
}

class Grid {
  final List<Line> lines;

  Grid({required this.lines});

  compute({bool useDiagonals = false}) {
    Map<Point, int> ventPoints = Map<Point, int>();

    for (var line
        in lines.where((line) => !useDiagonals ? line.straight : true)) {
      for (var point in line.points()) {
        var counter = ventPoints[point];
        if (counter != null) {
          ventPoints[point] = counter + 1;
        } else {
          ventPoints[point] = 1;
        }
      }
    }

    for (int y = 0; y < 10; y++) {
      var s = "";
      for (int x = 0; x < 10; x++) {
        var ref = ventPoints[Point(x: x, y: y)];
        if (ref == null) {
          s = "$s.";
        } else {
          s = "$s$ref";
        }
      }
      print(s);
    }

    return ventPoints.values.where((count) => count > 1).length;
  }
}
