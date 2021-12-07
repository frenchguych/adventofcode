import 'input.dart';

void main() {
  int total = boxes.fold<int>(0, (acc, box) => acc + box.surfaceToOrder);
  print("Total to order : $total feet²");
}
