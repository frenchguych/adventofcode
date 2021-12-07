class Crabs {
  List<int> data;

  Crabs(this.data);

  int get part1 {
    int min = 999999999999999999;
    int max = -1;
    for (var i = 0; i < data.length; i++) {
      if (data[i] < min) {
        min = data[i];
      }
      if (data[i] > max) {
        max = data[i];
      }
    }
    var minimumDistance = 999999999999999999;
    var resultPosition = -1;

    for (var targetPosition = min; targetPosition <= max; targetPosition++) {
      var totalDistance = 0;
      for (var p in data) {
        totalDistance += (p - targetPosition).abs();
      }
      if (totalDistance < minimumDistance) {
        minimumDistance = totalDistance;
        resultPosition = targetPosition;
      }
    }

    return minimumDistance;
  }

  double get part2 {
    int min = 999999999999999999;
    int max = -1;
    for (var i = 0; i < data.length; i++) {
      if (data[i] < min) {
        min = data[i];
      }
      if (data[i] > max) {
        max = data[i];
      }
    }
    var minimumFuel = 999999999999999999.0;
    var resultPosition = -1;

    for (var targetPosition = min; targetPosition <= max; targetPosition++) {
      var totalFuel = 0.0;
      for (var p in data) {
        var d = (p - targetPosition).abs();
        totalFuel += (d * (d + 1) / 2);
      }
      if (totalFuel < minimumFuel) {
        minimumFuel = totalFuel;
        resultPosition = targetPosition;
      }
    }

    return minimumFuel;
  }
}
