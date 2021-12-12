import '../lib/cave.dart';
import '../lib/input.dart';

void main() {
  Cave start = Cave.buildGraph(input);
  var paths = Cave.visit2(start);
  print(paths);
}
