class Sonar {
  Iterable<int> _sum3(List<int> sweeps) sync* {
    for (var i = 0; i < sweeps.length - 2; i++) {
      yield sweeps[i] + sweeps[i + 1] + sweeps[i + 2];
    }
  }

  int _compute(Iterable<int> sweeps) {
    int value = 0;
    int previous = sweeps.first;
    sweeps.skip(1).forEach((element) {
      if (element > previous) {
        value += 1;
      }
      previous = element;
    });
    return value;
  }

  int part1(List<int> sweeps) {
    return _compute(sweeps);
  }

  int part2(List<int> sweeps) {
    return _compute(_sum3(sweeps));
  }
}
