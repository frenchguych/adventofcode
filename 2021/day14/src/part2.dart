import '../lib/input.dart';
import '../lib/sythetizer.dart';

void main() {
  var synth = Synthetizer(template);
  for (int i = 0; i < 40; i++) {
    synth.advance(pairs);
  }
  var entries = synth.elements.entries;
  var max = entries.fold<MapEntry<String, int>>(
      const MapEntry<String, int>("", 0), (previousValue, element) => element.value > previousValue.value ? element : previousValue);
  var min = entries.fold<MapEntry<String, int>>(
      const MapEntry<String, int>("", 999999999999999999), (previousValue, element) => element.value < previousValue.value ? element : previousValue);
  print(max.value - min.value);
}
