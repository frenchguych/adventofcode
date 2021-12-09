import 'package:characters/characters.dart';

class StringChecker {
  final List<String> data;
  final String vowels = "aeiou";

  StringChecker(this.data);

  int get part1 {
    var count = 0;
    for (var line in data) {
      var containsAtLeastThreeVowels = line.characters
              .where((p0) => vowels.characters.contains(p0))
              .length >=
          3;

      var hasTwoConsecutiveLetters = () sync* {
        for (var i = 0; i < line.length - 1; i++) {
          if (line[i] == line[i + 1]) {
            yield true;
          }
        }
        yield false;
      }()
          .first;

      var doesNotContainsForbidenSequences = !line.contains("ab") &&
          !line.contains("cd") &&
          !line.contains("pq") &&
          !line.contains("xy");

      if (containsAtLeastThreeVowels &&
          hasTwoConsecutiveLetters &&
          doesNotContainsForbidenSequences) {
        count += 1;
      }
    }

    return count;
  }
}
