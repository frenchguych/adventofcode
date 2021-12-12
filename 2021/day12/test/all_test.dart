import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../lib/example.dart';
import '../lib/cave.dart';

void main() {
  //test(
  //  '',
  //  () {
  //    var start = Cave.buildGraph(input);
  //    var exploredPaths = Cave.visit(start, []);
  //    expect(
  //      exploredPaths.length,
  //      equals(226),
  //    );
  //  },
  //);

  test(
    '',
    () {
      var start = Cave.buildGraph([
        "start-A",
        "start-b",
        "A-c",
        "A-b",
        "b-d",
        "A-end",
        "b-end",
      ]);
      var exploredPaths = Cave.visit2(start);
      expect(
        exploredPaths,
        equals(36),
      );
    },
  );

  test(
    '',
    () {
      var start = Cave.buildGraph([
        "dc-end",
        "HN-start",
        "start-kj",
        "dc-start",
        "dc-HN",
        "LN-dc",
        "HN-end",
        "kj-sa",
        "kj-HN",
        "kj-dc",
      ]);
      var exploredPaths = Cave.visit2(start);
      expect(
        exploredPaths,
        equals(103),
      );
    },
  );

  test(
    '',
    () {
      var start = Cave.buildGraph(input);
      var exploredPaths = Cave.visit2(start);
      expect(
        exploredPaths,
        equals(3509),
      );
    },
  );
}
