import 'dart:io';
import 'dart:math';

Random rand = Random.secure();

class Memory {
  final List<int> _ints;
  Memory(this._ints);
  int operator [](int i) {
    switch (i) {
      case 0xffffff:
        return stdin.readByteSync();
      case 0xfffffe:
        return rand.nextInt(0x1000000);
      default:
        return _ints[i] & 0xffffff;
    }
  }

  operator []=(int i, int j) {
    switch (i) {
      case 0xffffff:
        stdout.writeCharCode(j);
        break;
      case 0xfffffe:
        _ints[rand.nextInt(0x1000000)] = j & 0xffffff;
        break;
      default:
        _ints[i] = j & 0xffffff;
        break;
    }
  }
}

class Machine {
  Memory mem;
  int pc;

  Machine(this.mem);

  void cycle() {
    var addr1 = mem[pc + 0];
    var offs1 = mem[pc + 1];
    var addr2 = mem[pc + 2];
    var offs2 = mem[pc + 3];
    var ninsn = mem[pc + 4];
    mem[mem[addr2] + offs2] = mem[mem[addr1] + offs1];
    pc = mem[ninsn];
  }
}
