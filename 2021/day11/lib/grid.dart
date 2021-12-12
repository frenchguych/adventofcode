class Grid {
  Grid();

  step(List<List<int>> input, {int steps = 2}) {
    var total = 0;
    //var grid = List<List<int>>.from(input);
    var grid = <List<int>>[];
    for (var r in input) {
      grid.add(List<int>.from(r));
    }

    for (var step = 0; step < steps; step++) {
      grid = singleStep(grid);

      for (var r = 0; r < 10; r++) {
        for (var c = 0; c < 10; c++) {
          if (grid[r][c] == 0) {
            total += 1;
          }
        }
      }
    }
    return total;
  }

  List<List<int>> singleStep(List<List<int>> input) {
    //var grid = List<List<int>>.from(input);
    var grid = <List<int>>[];
    for (var r in input) {
      grid.add(List<int>.from(r));
    }
    /* Phase 1 : increase the energy level by one */
    for (var row in grid) {
      for (var i = 0; i < 10; i++) {
        row[i] += 1;
      }
    }

    findFlashingOctopuses() sync* {
      for (var r = 0; r < 10; r++) {
        for (var c = 0; c < 10; c++) {
          if (grid[r][c] == 10) {
            yield [r, c];
          }
        }
      }
    }

    while (true) {
      var flashingOctopuses = findFlashingOctopuses().toList();
      if (flashingOctopuses.isEmpty) {
        break;
      }
      for (var cell in flashingOctopuses) {
        var r = cell[0];
        var c = cell[1];
        grid[r][c] = 11;
        for (var dr = -1; dr <= 1; dr++) {
          for (var dc = -1; dc <= 1; dc++) {
            var tr = r + dr;
            var tc = c + dc;
            if ((tr >= 0) && (tr < 10) && (tc >= 0) && (tc < 10)) {
              if (grid[tr][tc] < 10) {
                grid[tr][tc] += 1;
              }
            }
          }
        }
      }
    }

    for (var r = 0; r < 10; r++) {
      for (var c = 0; c < 10; c++) {
        if (grid[r][c] > 9) {
          grid[r][c] = 0;
        }
      }
    }

    return grid;
  }

  int syncStep(List<List<int>> input) {
    //var grid = List<List<int>>.from(input);
    var grid = <List<int>>[];
    for (var r in input) {
      grid.add(List<int>.from(r));
    }

    var step = 1;
    while (true) {
      grid = singleStep(grid);
      int value = 0;
      for (var r in grid) {
        for (var c in r) {
          value += c;
        }
      }
      if (value == 0) {
        break;
      }
      step += 1;
    }

    return step;
  }
}
