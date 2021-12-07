import 'package:characters/characters.dart';

class InstructionReader {
  InstructionReader({required this.instructions});

  final String instructions;

  read() {
    var simplifiedInstructions =
        instructions.replaceAll('()', '').replaceAll(')(', '');
    return simplifiedInstructions.characters.where((c) => c == '(').length -
        simplifiedInstructions.characters.where((c) => c == ')').length;
  }

  int findBasementMove() {
    var floor = 0;
    for (var i = 0; i < instructions.characters.length; i++) {
      floor += (instructions.characters.characterAt(i).single == '(' ? 1 : -1);
      if (floor == -1) return (i + 1);
    }
    return -1;
  }
}
