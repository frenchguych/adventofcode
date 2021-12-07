import 'dart:math';

class Grid {
  var data = <int, int>{};

  Grid(List<int> input) {
    for (int i in input) {
      data[i] = (data[i] ?? 0) + 1;
    }
  }

  evolve(int iterations) {
    for (var iteration = 0; iteration < iterations; iteration++) {
      // First, count the number of zeros
      var zeros = data[0] ?? 0;
      // Decrement each values, rolling zeros to 6
      var newData = <int, int>{};
      if (zeros > 0) {
        newData[6] = zeros;
      }
      for (var i = 1; i <= 8; i++) {
        var n = data[i] ?? 0;
        if (n > 0) {
          newData[i - 1] = (newData[i - 1] ?? 0) + n;
        }
      }
      if (zeros > 0) {
        newData[8] = zeros;
      }
      data = newData;
    }
  }

  int get result =>
      data.values.fold(0, (previousValue, element) => previousValue + element);
}
