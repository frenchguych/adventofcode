import '../lib/input.dart';
import '../lib/paper.dart';

void main() {
  var paper = Paper(input);
  paper.fold(
    instructions[0][0] as String,
    instructions[0][1] as int,
  );
  print(paper.count());
}
