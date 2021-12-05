import 'lib/input.dart';
import 'lib/matrix.dart';

void main() {
  Matrix? lastWinner;
  int? lastNumber;

  for (var number in numbers) {
    grids = grids.where((grid) => !grid.winner).toList();
    print("${grids.length} grids left in game");
    for (var grid in grids) {
      grid.mark(number);
    }
    var winners = grids.where((grid) => grid.winner);
    if (winners.length > 0) {
      print("We got ${winners.length} winners");
      lastWinner = winners.toList()[0];
      lastNumber = number;
    }
  }

  print("We have a winner !");
  print(lastWinner);
  print(lastNumber! * lastWinner!.score());
}
