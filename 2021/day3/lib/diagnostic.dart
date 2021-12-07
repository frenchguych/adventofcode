import 'package:characters/characters.dart';

class Diagnostic {
  final List<String> input;

  Diagnostic(this.input);

  int get gamma {
    var l = input[0].length;
    var value = 0;

    for (var i = 0; i < l; i++) {
      var ones = input
          .map<String>((e) => e.characters.characterAt(i).single)
          .fold<int>(
              0,
              (previousValue, element) =>
                  previousValue + (element == '1' ? 1 : 0));
      value <<= 1;
      if (ones > (input.length / 2)) {
        value |= 1;
      }
    }

    return value;
  }

  int get epsilon {
    var l = input[0].length;
    var value = 0;

    for (var i = 0; i < l; i++) {
      var ones = input
          .map<String>((e) => e.characters.characterAt(i).single)
          .fold<int>(
              0,
              (previousValue, element) =>
                  previousValue + (element == '1' ? 1 : 0));
      value <<= 1;
      if (ones < (input.length / 2)) {
        value |= 1;
      }
    }

    return value;
  }

  int get oxygen {
    var data = input;
    for (var i = 0; i < input[0].length; i++) {
      var ones = data
          .map<String>((e) => e.characters.characterAt(i).single)
          .fold<int>(0,
              (previousValue, element) => previousValue + int.parse(element));
      var keep = ones >= (data.length / 2) ? "1" : "0";
      data = data
          .where((element) => element.characters.characterAt(i).single == keep)
          .toList();
      if (data.length == 1) {
        break;
      }
    }
    var value = 0;
    for (var c in data.single.characters) {
      value <<= 1;
      value |= int.parse(c);
    }

    return value;
  }

  int get co2 {
    var data = input;
    for (var i = 0; i < input[0].length; i++) {
      var ones = data
          .map<String>((e) => e.characters.characterAt(i).single)
          .fold<int>(0,
              (previousValue, element) => previousValue + int.parse(element));
      var keep = ones >= (data.length / 2) ? "0" : "1";
      data = data
          .where((element) => element.characters.characterAt(i).single == keep)
          .toList();
      if (data.length == 1) {
        break;
      }
    }
    var value = 0;
    for (var c in data.single.characters) {
      value <<= 1;
      value |= int.parse(c);
    }

    return value;
  }
}
