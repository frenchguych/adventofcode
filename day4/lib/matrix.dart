class Cell {
  final int value;
  bool marked = false;

  Cell({required this.value});
}

class Row {
  bool allMarked = false;
  var cells = <Cell>[];
  Row(List<int> numbers) {
    cells.addAll(numbers.map((i) => Cell(value: i)));
  }

  int mark(int value) {
    int returnValue = -1;

    for (var i = 0; i < cells.length; i++) {
      var cell = cells[i];
      if (cell.value == value) {
        cell.marked = true;
        allMarked = !cells.any((cell) => !cell.marked);
        returnValue = i;
        break;
      }
    }
    return returnValue;
  }

  @override
  String toString() {
    var value = "";
    for (var cell in cells) {
      value = "$value ${cell.marked ? "[" : ""}${cell.value}${cell.marked ? "]" : ""}";
    }
    return value;
  }
}

class Matrix {
  static int pkGenerator = 0;

  final int pk;

  Matrix() : pk = ++pkGenerator {}

  bool winner = false;

  var rows = <Row>[];
  addRow(List<int> row) {
    rows.add(Row(row));
  }

  mark(int value) {
    for (var row in rows) {
      var column = row.mark(value);
      if (column == -1) {
        // nothing to do.
      } else {
        if (row.allMarked) {
          winner = true;
        } else {
          winner = !rows.map((row) => row.cells[column]).any((cell) => !cell.marked);
        }
      }
    }
  }

  @override
  String toString() {
    var value = "";
    for (var row in rows) {
      value = "$value${value.isEmpty ? "" : "\n"}${row.toString()}";
    }
    return value;
  }

  int score() {
    var score = rows
        .map((row) => row.cells.fold<int>(0, (previousValue, cell) => previousValue + (cell.marked ? 0 : cell.value)))
        .fold<int>(0, (previousValue, rowScore) => previousValue + rowScore);

    return score;
  }
}
