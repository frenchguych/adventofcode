import 'package:test/expect.dart';
import 'package:test/test.dart';
import '../lib/instructions_reader.dart';

void main() {
  test(') enters the basement at position 1', () {
    expect(InstructionReader(instructions: ')').findBasementMove(), 1);
  });

  test('()()) enters the basement at position 5', () {
    expect(InstructionReader(instructions: '()())').findBasementMove(), 5);
  });
}
