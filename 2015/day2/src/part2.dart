import 'input.dart';

void main() {
  print(boxes.fold<int>(0, (acc, box) => acc + box.ribbonLength));
}
