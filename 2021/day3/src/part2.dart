import '../lib/diagnostic.dart';
import '../lib/input.dart';

void main() {
  var d = Diagnostic(input);
  print(d.oxygen * d.co2);
}
