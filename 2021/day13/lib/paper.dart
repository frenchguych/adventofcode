import 'dart:math';

class Paper {
  final List<List<int>> input;

  late List<List<int>> grid;
  late int maxX;
  late int maxY;

  Paper(this.input) {
    maxX = input.map((e) => e[0]).fold(0, max);
    maxY = input.map((e) => e[1]).fold(0, max);
    grid = List.generate(1 + maxX, (index) => List.filled((1 + maxY), 0), growable: false);
    for (var i = 0; i < input.length; i++) {
      grid[input[i][0]][input[i][1]] = 1;
    }
  }

  int count() {
    var count = foldedGrid().fold<int>(0, (previousValue, element) {
      return element.fold(previousValue, (previousValue, element) {
        return previousValue + element;
      });
    });
    return count;
  }

  fold(String axis, int pos) {
    if (axis == 'x') {
      var middle = maxX / 2;
      if (pos < middle) {
        // Fold right
        for (var x = pos - 1; x >= 0; x--) {
          for (var y = 0; y <= maxY; y++) {
            if (grid[x][y] == 1) {
              grid[2 * pos - x][y] = grid[x][y];
            }
          }
        }
        // Offset
        for (var x = pos + 1; x <= maxX; x++) {
          for (var y = 0; y <= maxY; y++) {
            grid[x - pos - 1][y] = grid[x][y];
          }
        }
      } else {
        // Fold left
        for (var x = pos + 1; x <= maxX; x++) {
          for (var y = 0; y <= maxY; y++) {
            if (grid[x][y] == 1) {
              grid[2 * pos - x][y] = grid[x][y];
            }
          }
        }
      }
      maxX = pos - 1;
    } else {
      var middle = maxY / 2;
      if (pos < middle) {
        // Fold right
        for (var x = 0; x <= maxX; x++) {
          for (var y = pos - 1; y >= 0; y--) {
            if (grid[x][y] == 1) {
              grid[x][2 * pos - y] = grid[x][y];
            }
          }
        }
        // Offset
        for (var x = 0; x <= maxX; x++) {
          for (var y = pos + 1; y <= maxY; y++) {
            grid[x][y - pos - 1] = grid[x][y];
          }
        }
      } else {
        // Fold left
        for (var x = 0; x <= maxX; x++) {
          for (var y = pos + 1; y <= maxY; y++) {
            if (grid[x][y] == 1) {
              grid[x][2 * pos - y] = grid[x][y];
            }
          }
        }
      }
      maxY = pos - 1;
    }
  }

  printGrid() {
    var grid = foldedGrid();
    for (var y = 0; y < grid[0].length; y++) {
      var row = "";
      for (var x = 0; x < grid.length; x++) {
        row = "$row${(grid[x][y] == 0 ? "." : "#")}";
      }
      print(row);
    }
  }

  List<List<int>> foldedGrid() {
    Iterable<int> colgen(int x) sync* {
      for (var y = 0; y <= maxY; y++) {
        yield grid[x][y];
      }
    }

    Iterable<List<int>> gridgen() sync* {
      for (var x = 0; x <= maxX; x++) {
        yield colgen(x).toList();
      }
    }

    return gridgen().toList();
  }
}
