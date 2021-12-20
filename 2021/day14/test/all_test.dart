import 'dart:math';

import 'package:test/expect.dart';
import 'package:test/test.dart';

import '../lib/example.dart';
import '../lib/sythetizer.dart';

void main() {
  test(
    '',
    () {
      var synth = Synthetizer(template);
      expect(synth.length, equals(4));
    },
  );

  test(
    '',
    () {
      var synth = Synthetizer(template);
      synth.advance(pairs);
      synth.advance(pairs);
      synth.advance(pairs);
      synth.advance(pairs);
      expect(synth.length, equals(49));
    },
  );

  test(
    '',
    () {
      var synth = Synthetizer(template);
      synth.advance(pairs);
      synth.advance(pairs);
      synth.advance(pairs);
      synth.advance(pairs);
      synth.advance(pairs);
      synth.advance(pairs);
      synth.advance(pairs);
      synth.advance(pairs);
      synth.advance(pairs);
      synth.advance(pairs);
      expect(synth.length, equals(3073));
      var entries = synth.elements.entries;
      var max = entries.fold<MapEntry<String, int>>(
          const MapEntry<String, int>("", 0), (previousValue, element) => element.value > previousValue.value ? element : previousValue);
      var min = entries.fold<MapEntry<String, int>>(
          const MapEntry<String, int>("", 99999999999999), (previousValue, element) => element.value < previousValue.value ? element : previousValue);
      expect(
        max.value,
        equals(1749),
      );
      expect(
        max.key,
        equals("B"),
      );
      expect(
        min.value,
        equals(161),
      );
      expect(
        min.key,
        equals("H"),
      );
    },
  );

  test(
    '',
    () {
      var synth = Synthetizer(template);
      for (var i = 0; i < 40; i++) {
        synth.advance(pairs);
      }
      var entries = synth.elements.entries;
      var max = entries.fold<MapEntry<String, int>>(
          const MapEntry<String, int>("", 0), (previousValue, element) => element.value > previousValue.value ? element : previousValue);
      var min = entries.fold<MapEntry<String, int>>(
          const MapEntry<String, int>("", 999999999999999), (previousValue, element) => element.value < previousValue.value ? element : previousValue);
      expect(
        max.value,
        equals(2192039569602),
      );
      expect(
        max.key,
        equals("B"),
      );
      expect(
        min.value,
        equals(3849876073),
      );
      expect(
        min.key,
        equals("H"),
      );
      expect(
        max.value - min.value,
        equals(2188189693529),
      );
    },
  );
}
