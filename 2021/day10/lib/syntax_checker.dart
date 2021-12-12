import 'package:characters/characters.dart';

class SyntaxChecker {
  final List<String> input;

  SyntaxChecker(this.input);

  String check_line(String line) {
    var stack = <String>[];
    for (var c in line.characters) {
      if (c == "(" || c == "[" || c == "{" || c == "<") {
        stack.add(c);
      } else {
        var o = stack.last;
        if ((c == ")" && o != "(") ||
            (c == "]" && o != "[") ||
            (c == "}" && o != "{") ||
            (c == ">" && o != "<")) {
          return c;
        } else {
          stack.removeLast();
        }
      }
    }
    return stack.length > 0 ? "INCOMPLETE" : "";
  }

  List<String>? check_line_2(String line) {
    var stack = <String>[];
    for (var c in line.characters) {
      if (c == "(" || c == "[" || c == "{" || c == "<") {
        stack.add(c);
      } else {
        var o = stack.last;
        if ((c == ")" && o != "(") ||
            (c == "]" && o != "[") ||
            (c == "}" && o != "{") ||
            (c == ">" && o != "<")) {
          return null;
        } else {
          stack.removeLast();
        }
      }
    }
    return stack;
  }

  int get part1 {
    var total = 0;
    for (var line in input) {
      var ret = check_line(line);
      if (ret == "INCOMPLETE") {
        // ignore incomplete lines
      } else if (ret == "") {
        // ignore valid lines
      } else {
        // Line has error
        /*
        ): 3 points.
        ]: 57 points.
        }: 1197 points.
        >: 25137 points.
        */
        if (ret == ")") {
          total += 3;
        }
        if (ret == "]") {
          total += 57;
        }
        if (ret == "}") {
          total += 1197;
        }
        if (ret == ">") {
          total += 25137;
        }
      }
    }
    return total;
  }

  int get part2 {
    var scores = <int>[];
    for (var line in input) {
      var ret = check_line_2(line);
      if (ret != null) {
        scores.add(
          ret.reversed.fold<int>(
            0,
            (previousValue, element) {
              var score = previousValue * 5;
              /*
                ): 1 point.
                ]: 2 points.
                }: 3 points.
                >: 4 points.
              */
              if (element == "(") score += 1;
              if (element == "[") score += 2;
              if (element == "{") score += 3;
              if (element == "<") score += 4;

              return score;
            },
          ),
        );
      }
    }

    scores.sort();
    var middle = scores.length ~/ 2;
    return scores[middle];
  }
}
