import 'package:test/expect.dart';
import 'package:test/test.dart';

import '../lib/instructions_reader.dart';

void main() {
  test('(()) returns 0', () {
    expect(InstructionReader(instructions: '(())').read(), 0);
  });

  test('()() returns 0', () {
    expect(InstructionReader(instructions: '()()').read(), 0);
  });

  test('((( returns 3', () {
    expect(InstructionReader(instructions: '(((').read(), 3);
  });

  test('(()(()( returns 3', () {
    expect(InstructionReader(instructions: '(()(()(').read(), 3);
  });

  test('))((((( returns 3', () {
    expect(InstructionReader(instructions: '))(((((').read(), 3);
  });

  test('()) returns -1', () {
    expect(InstructionReader(instructions: '())').read(), -1);
  });

  test('))( returns -1', () {
    expect(InstructionReader(instructions: '))(').read(), -1);
  });

  test('))) returns -3', () {
    expect(InstructionReader(instructions: ')))').read(), -3);
  });

  test(')())()) returns -3', () {
    expect(InstructionReader(instructions: ')())())').read(), -3);
  });
}
