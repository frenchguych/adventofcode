import '../lib/input.dart';
import '../lib/paper.dart';

void main() {
  var paper = Paper(input);
  for (int i = 0; i < instructions.length; i++) {
    paper.fold(
      instructions[i][0] as String,
      instructions[i][1] as int,
    );
  }

  paper.printGrid();
}
