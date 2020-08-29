import 'dart:math';

Random rand = Random.secure();

class Ram {
  final List<int> _ints;
  Ram(this._ints);
  int operator [](int i) => _ints[i] & 0xffffff;
  operator []=(int i, int j) => _ints[i] = j & 0xffffff;
}

class Registers {
  int _pc = 0, _a = 0, _b = 0;
  set a(int a) => _a = a & 0xffffff;
  int get a => _a & 0xffffff;
  set b(int b) => _b = b & 0xffffff;
  int get b => _b & 0xffffff;
  set pc(int pc) => _pc = pc & 0xffffff;
  int get pc => _pc & 0xffffff;
}

class Flags {
  bool zero = false, nonzero = false, overflow = false;
  bool operator [](int i) =>
      i == 0 ? zero : i == 1 ? nonzero : i == 2 ? overflow : rand.nextBool();
  operator []=(int i, bool b) {
    if (i == 0)
      zero = b;
    else if (i == 1)
      nonzero = b;
    else if (i == 2)
      overflow = b;
    else
      this[rand.nextInt(4)] = b;
  }
}

class Machine {
  Registers regs = Registers();
  Ram ram;
  Flags flags = Flags();

  Machine(this.ram);

  void cycle() {
    var instruction = ram[regs.pc];
    var operand = ram[regs.pc + 1];
    switch (instruction) {
      case 0:
        break;
      case 1:
        regs.a = operand;
        break;
      case 2:
        regs.b = operand;
        break;
      case 3:
        ram[operand] = regs.a;
        break;
      case 4:
        ram[operand] = regs.b;
        break;
      case 5:
        regs.a &= ram[operand];
        break;
      case 6:
        regs.b &= ram[operand];
        break;
      case 7:
        regs.a |= ram[operand];
        break;
      case 8:
        regs.b |= ram[operand];
        break;
      case 9:
        regs.a ^= ram[operand];
        break;
      case 10:
        regs.b ^= ram[operand];
        break;
      case 11:
        regs.a = ~regs.a;
        break;
      case 12:
        regs.b = ~regs.b;
        break;
      case 13:
        regs.a += ram[operand];
        break;
      case 14:
        regs.b += ram[operand];
        break;
      case 15:
        regs.a -= ram[operand];
        break;
      case 16:
        regs.b -= ram[operand];
        break;
    }
    regs.pc += 2;
  }
}
