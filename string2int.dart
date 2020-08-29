import 'dart:typed_data';

Uint8List string2int(String s) {
  assert(s.length % 5 == 0);
  var bits = <int>[];
  for (var i = 0; i < s.length; i += 5) {
    for (var j = i + 1; j < i + 5; j++) {
      assert(s[j] == '-');
    }
    assert(s[i] == '-' || s[i] == '.');
    bits.add(s[i] == '.' ? 1 : 0);
  }
  assert(bits.length % 8 == 0);
  var bytes = <int>[];
  for (var i = 0; i < bits.length; i += 8) {
    bytes.add(bits[i + 0] << 0 |
        bits[i + 1] << 1 |
        bits[i + 2] << 2 |
        bits[i + 3] << 3 |
        bits[i + 4] << 4 |
        bits[i + 5] << 5 |
        bits[i + 6] << 6 |
        bits[i + 7] << 7);
  }
  return Uint8List.fromList(bytes);
}
