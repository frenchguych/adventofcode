class Grid {
  final List<List<int>> data;

  Grid(this.data);

  List<List<int>> _points() {
    int rows = data.length;
    int cols = data[0].length;

    List<List<bool>> lowPoints =
        List.generate(rows, (index) => List.generate(cols, (index) => false));

    lowPoints[0][0] = data[0][0] < data[1][0] && data[0][0] < data[0][1];
    lowPoints[rows - 1][0] = data[rows - 1][0] < data[rows - 2][0] &&
        data[rows - 1][0] < data[rows - 1][1];
    lowPoints[rows - 1][cols - 1] =
        data[rows - 1][cols - 1] < data[rows - 1][cols - 2] &&
            data[rows - 1][cols - 1] < data[rows - 2][cols - 1];
    lowPoints[0][cols - 1] = data[0][cols - 1] < data[1][cols - 1] &&
        data[0][cols - 1] < data[0][cols - 2];

    for (var col = 1; col <= cols - 2; col++) {
      lowPoints[0][col] = data[0][col] < data[0][col - 1] &&
          data[0][col] < data[0][col + 1] &&
          data[0][col] < data[1][col];

      lowPoints[rows - 1][col] =
          data[rows - 1][col] < data[rows - 1][col - 1] &&
              data[rows - 1][col] < data[rows - 1][col + 1] &&
              data[rows - 1][col] < data[rows - 2][col];
    }

    for (var row = 1; row <= rows - 2; row++) {
      lowPoints[row][0] = data[row][0] < data[row - 1][0] &&
          data[row][0] < data[row + 1][0] &&
          data[row][0] < data[row][1];

      lowPoints[row][cols - 1] =
          data[row][cols - 1] < data[row - 1][cols - 1] &&
              data[row][cols - 1] < data[row + 1][cols - 1] &&
              data[row][cols - 1] < data[row][cols - 2];
    }

    for (var row = 1; row <= rows - 2; row++) {
      for (var col = 1; col <= cols - 2; col++) {
        lowPoints[row][col] = data[row][col] < data[row - 1][col] &&
            data[row][col] < data[row + 1][col] &&
            data[row][col] < data[row][col + 1] &&
            data[row][col] < data[row][col - 1];
      }
    }

    findLowPoints() sync* {
      for (var row = 0; row <= rows - 1; row++) {
        for (var col = 0; col <= cols - 1; col++) {
          if (lowPoints[row][col]) {
            yield [row, col];
          }
        }
      }
    }

    return findLowPoints().toList();
  }

  int get part1 {
    var total = _points().fold<int>(
        0,
        (previousValue, element) =>
            previousValue + 1 + data[element[0]][element[1]]);

    return total;
  }

  int get part2 {
    int rows = data.length;
    int cols = data[0].length;
    var points = _points();
    List<List<int>> bassins =
        List.generate(rows, (index) => List.generate(cols, (index) => 0));

    var i = 1;
    for (var lowPoint in points) {
      bassins[lowPoint[0]][lowPoint[1]] = i;
      i = i + 1;
    }
    for (var row = 0; row < rows; row++) {
      for (var col = 0; col < cols; col++) {
        if (data[row][col] == 9) {
          bassins[row][col] = -1;
        }
      }
    }

    var done = true;

    do {
      done = true;
      for (var row = 0; row < rows; row++) {
        for (var col = 0; col < cols; col++) {
          var cellValue = bassins[row][col];
          if (cellValue == 0) {
            for (var drow = -1; drow <= 1; drow++) {
              for (var dcol = -1; dcol <= 1; dcol++) {
                if (((row + drow) >= 0) &&
                    ((row + drow) < rows) &&
                    ((col + dcol) >= 0) &&
                    ((col + dcol) < cols) &&
                    !((drow == 0) && (dcol == 0)) &&
                    ((drow == 0) || (dcol == 0))) {
                  var adjacentCellValue = bassins[row + drow][col + dcol];
                  if (adjacentCellValue > 0) {
                    bassins[row][col] = adjacentCellValue;
                    done = false;
                  }
                }
              }
            }
          }
        }
      }
    } while (!done);

    var map = <int, int>{};

    for (var row = 0; row < rows; row++) {
      for (var col = 0; col < cols; col++) {
        if (bassins[row][col] != -1) {
          map[bassins[row][col]] = (map[bassins[row][col]] ?? 0) + 1;
        }
      }
    }

    var values = map.values.toList();
    values.sort();
    values = values.reversed.toList();

    return values[0] * values[1] * values[2];
  }
}
