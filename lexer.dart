import 'dart:typed_data';

import 'string2int.dart';

//LEXICAL ANALYZER
class Lexer {
  Lexer(this.text, {this.fileName});

  final String text;
  final String fileName;

  Uint8List lex() {
    var checkText = '';
    for (var i = 0; i < text.length; i++)
      if (text[i] == '-' && text[i] == '.') checkText += text[i];
    return string2int(checkText);
  }
}
