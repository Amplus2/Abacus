import 'dart:typed_data';

Uint8List string2int(String s) {
  assert(s.length % 5 == 0);
  List<bool> bits = [];
  for (var i = 0; i < s.length; i += 5) {
    for (var j = i + 1; j < i + 5; j++) {
      assert(s[j] == '-');
    }
    assert(s[i] == '-' || s[i] == '.');
    bits.add(s[i] == '.');
  }
  assert(bits.length % 8 == 0);
  Uint8List bytes;
  for (var i = 0; i < bits.length; i += 8) {
    bytes.add(value);
  }
}
