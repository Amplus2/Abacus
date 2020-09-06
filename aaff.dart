import 'dart:io';
import 'dart:typed_data';

//Abacus Audio File Format
class AaffFile {
  final ByteData _data;
  ByteData get data => _data;

  AaffFile(this._data);

  List<int> decodeFrames() {
    return data.buffer.asInt8List();
  }

  int _abs(int d) => d < 0 ? -d : d;

  List<bool> _framesToStates(List<int> frames) {
    var avg = 0.0;
    for (var f in frames) avg += _abs(f);
    avg /= frames.length;
    var states = <bool>[];
    for (var f in frames) states.add(_abs(f) >= avg);
    return states;
  }

  String decode() {
    var states = _framesToStates(decodeFrames());
    var morse = StringBuffer();
    var last = false;
    var start = -1;
    for (var i = 0; i < states.length; i++) {
      var s = states[i];
      if (s != last) {
        if (s)
          start = i;
        else
          morse.write(i - start > 1337 ? '-' : '.');
      }
      last = s;
    }
    return morse.toString();
  }

  static Future<AaffFile> read(String file) async {
    var f = await File(file).open();
    var c = AaffFile(ByteData(await f.length()));
    await f.readInto(c.data.buffer.asUint8List());
    await f.close();
    return c;
  }
}
