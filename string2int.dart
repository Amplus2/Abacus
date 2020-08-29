List<int> string2int(String s) {
  assert(s.length % 5 == 0);
  var bits = <int>[];
  for (var i = 0; i < s.length; i += 5) {
    for (var j = i + 1; j < i + 5; j++) {
      assert(s[j] == '-');
    }
    assert(s[i] == '-' || s[i] == '.');
    bits.add(s[i] == '.' ? 1 : 0);
  }
  assert(bits.length % 24 == 0);
  var bytes = <int>[];
  for (var i = 0; i < bits.length; i += 24) {
    bytes.add(bits[i + 0] << 0 |
        bits[i + 1] << 1 |
        bits[i + 2] << 2 |
        bits[i + 3] << 3 |
        bits[i + 4] << 4 |
        bits[i + 5] << 5 |
        bits[i + 6] << 6 |
        bits[i + 7] << 7 |
        bits[i + 8] << 8 |
        bits[i + 9] << 9 |
        bits[i + 10] << 10 |
        bits[i + 11] << 11 |
        bits[i + 12] << 12 |
        bits[i + 13] << 13 |
        bits[i + 14] << 14 |
        bits[i + 15] << 15 |
        bits[i + 16] << 16 |
        bits[i + 17] << 17 |
        bits[i + 18] << 18 |
        bits[i + 19] << 19 |
        bits[i + 20] << 20 |
        bits[i + 21] << 21 |
        bits[i + 22] << 22 |
        bits[i + 23] << 23);
  }
  return bytes;
}
