import 'dart:typed_data';

import 'string2int.dart';

//LEXICAL ANALYZER
class Lexer {
  Lexer(this.text, {this.fileName});

  final String text;
  final String fileName;
  static final _dash = '-'.codeUnitAt(0), _dot = '.'.codeUnitAt(0);

  Uint8List lex() {
    var checkText = '';
    for (var i = 0; i < text.length; i++) {
      var codeUnit = text.codeUnitAt(i);
      if (codeUnit == _dash || codeUnit == _dot) checkText += text[i];
    }
    return string2int(checkText);
  }
}
