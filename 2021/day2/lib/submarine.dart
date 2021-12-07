class Command {
  late final String action;
  late final int value;

  Command(String command) {
    var args = command.split(" ");
    action = args[0];
    value = int.parse(args[1]);
  }
}

extension MakeCommand on Iterable<String> {
  Iterable<Command> commands() {
    return this.map((move) => Command(move));
  }
}

class Submarine {
  int part1(Iterable<String> moves) {
    int position = 0, depth = 0;
    for (var command in moves.commands()) {
      switch (command.action) {
        case "forward":
          position += command.value;
          break;
        case "up":
          depth -= command.value;
          break;
        case "down":
          depth += command.value;
      }
    }
    return position * depth;
  }

  int part2(Iterable<String> moves) {
    int position = 0, aim = 0, depth = 0;
    for (var command in moves.commands()) {
      switch (command.action) {
        case "forward":
          position += command.value;
          depth += aim * command.value;
          break;
        case "up":
          aim -= command.value;
          break;
        case "down":
          aim += command.value;
      }
    }
    return position * depth;
  }
}
