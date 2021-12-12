class Cave {
  final connections = <Cave>[];
  final String name;

  Cave(this.name);

  connectTo(Cave other) {
    connections.add(other);
  }

  /*
  visit(start, [])
    visit(A, [start])
      visit(c, [start, A])
      visit(end, [start, A])
      visit(b, [start, A])
        visit(d, [start, A, b])
          invalid path!
        visit(end, [start, A, b])
        visit(A, [start, A, b])
    visib(b, [start])
  */
  static List<List<Cave>> visit(Cave cave, List<Cave> path) {
    if (cave.name == "end") {
      path.add(cave);
      return [path];
    }
    var exploredCaves = <List<Cave>>[];

    for (var connection in cave.connections) {
      if (connection.name == connection.name.toLowerCase()) {
        // Small cave.
        if (path.where((cave) => cave.name == connection.name).isEmpty) {
          // We can continue.
          var newPath = List<Cave>.from(path)..add(cave);
          exploredCaves.addAll(visit(connection, newPath));
        }
      } else {
        var newPath = List<Cave>.from(path)..add(cave);
        exploredCaves.addAll(visit(connection, newPath));
      }
    }

    return exploredCaves;
  }

  static final visitedSmallCaves = <String>[];

  static int visit2(Cave cave) {
    if (cave.name == "end") {
      return 1;
    }
    var exploredCaves = 0;

    for (var connection in cave.connections) {
      if (connection.name == "start") {
        continue;
      }
      if (connection.name == connection.name.toLowerCase()) {
        // Small cave.
        if (!visitedSmallCaves.contains(connection.name)) {
          // We can continue.
          visitedSmallCaves.add(connection.name);
          exploredCaves += visit2(connection);
          visitedSmallCaves.removeLast();
        } else {
          var visitedTwice = visitedSmallCaves
              .map((name) => visitedSmallCaves.where((n) => n == name).length)
              .where((n) => n != 1);
          if (visitedTwice.isEmpty) {
            visitedSmallCaves.add(connection.name);
            exploredCaves += visit2(connection);
            visitedSmallCaves.removeLast();
          }
        }
      } else {
        exploredCaves += visit2(connection);
      }
    }

    return exploredCaves;
  }

  factory Cave.buildGraph(List<String> input) {
    var caves = <String, Cave>{};

    for (var line in input) {
      var temp = line.split("-");

      Cave getOrCreateCave(String caveName) {
        var cave = caves[caveName];
        if (cave == null) {
          cave = Cave(caveName);
          caves[caveName] = cave;
        }
        return cave;
      }

      var cave1 = getOrCreateCave(temp[0]);
      var cave2 = getOrCreateCave(temp[1]);

      cave1.connectTo(cave2);
      cave2.connectTo(cave1);
    }

    return caves["start"]!;
  }
}
