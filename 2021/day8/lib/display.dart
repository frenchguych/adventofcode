import 'dart:math';

import 'package:characters/characters.dart';

class Display {
  final List<List<List<String>>> input;

  Display(this.input);

  int get part1 {
    var total = 0;
    for (var line in input) {
      var digits = line[1];
      for (var digit in digits) {
        switch (digit.length) {
          case 2:
          case 3:
          case 4:
          case 7:
            total += 1;
            break;
        }
      }
    }
    return total;
  }

  int _process(List<List<String>> line) {
    var data = line[0];
    String signalsForOne = data.firstWhere((element) => element.length == 2);
    String signalsForSeven = data.firstWhere((element) => element.length == 3);
    String signalsForEight = data.firstWhere((element) => element.length == 7);
    String signalsForFour = data.firstWhere((element) => element.length == 4);

    List<String> signalsForZeroAndSixAndNine =
        data.where((element) => element.length == 6).toList();

    var find6 = () sync* {
      for (String signals in signalsForZeroAndSixAndNine) {
        if (signals.characters
                .where((p0) => !signalsForSeven.contains(p0))
                .length ==
            4) yield signals;
      }
    };

    String signalsForSix = find6().first;

    var find9 = () sync* {
      for (String signals in signalsForZeroAndSixAndNine) {
        if (signals.characters
                .where((p0) => !(signalsForSeven.characters.contains(p0) ||
                    signalsForFour.characters.contains(p0)))
                .length ==
            1) yield signals;
      }
    };

    String signalsForNine = find9().first;

    List<String> signalsForTwoOrThreeOrFive =
        data.where((element) => element.length == 5).toList();

    var find2 = () sync* {
      for (String signals in signalsForTwoOrThreeOrFive) {
        if (signals.characters
                .where((p0) => !signalsForNine.contains(p0))
                .length ==
            1) yield signals;
      }
    };

    String signalsForTwo = find2().first;

    String signalsForZero = signalsForZeroAndSixAndNine
        .where((element) =>
            ((element != signalsForSix) && (element != signalsForNine)))
        .first;

    List<String> signalsForThreeOrFive = signalsForTwoOrThreeOrFive
        .where((element) => element != signalsForTwo)
        .toList();

    var signalsForThree = signalsForThreeOrFive[0]
                .characters
                .where((p0) => !signalsForOne.characters.contains(p0))
                .length ==
            3
        ? signalsForThreeOrFive[0]
        : signalsForThreeOrFive[1];

    var signalsForFive = signalsForThreeOrFive[1]
                .characters
                .where((p0) => !signalsForOne.characters.contains(p0))
                .length ==
            3
        ? signalsForThreeOrFive[0]
        : signalsForThreeOrFive[1];

    var sortString = (String str) {
      var l = str.characters.toList();
      l.sort();
      return l.fold<String>(
          "", (previousValue, element) => "$previousValue$element");
    };

    signalsForOne = sortString(signalsForOne);
    signalsForTwo = sortString(signalsForTwo);
    signalsForThree = sortString(signalsForThree);
    signalsForFour = sortString(signalsForFour);
    signalsForFive = sortString(signalsForFive);
    signalsForSix = sortString(signalsForSix);
    signalsForSeven = sortString(signalsForSeven);
    signalsForEight = sortString(signalsForEight);
    signalsForNine = sortString(signalsForNine);
    signalsForZero = sortString(signalsForZero);

    var output = 0;
    var digits = line[1];
    for (var digit in digits) {
      digit = sortString(digit);
      var d = 0;
      if (digit == signalsForOne) d = 1;
      if (digit == signalsForTwo) d = 2;
      if (digit == signalsForThree) d = 3;
      if (digit == signalsForFour) d = 4;
      if (digit == signalsForFive) d = 5;
      if (digit == signalsForSix) d = 6;
      if (digit == signalsForSeven) d = 7;
      if (digit == signalsForEight) d = 8;
      if (digit == signalsForNine) d = 9;
      if (digit == signalsForZero) d = 0;
      output = output * 10 + d;
    }

    return output;
  }

  int get part2 {
    int total = 0;
    for (var line in input) {
      total += _process(line);
    }

    return total;
  }
}
