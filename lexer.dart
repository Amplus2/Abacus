import 'string2int.dart';

//LEXICAL ANALYZER
class Lexer {
  Lexer(this.text, {this.fileName});

  final String text;
  final String fileName;
  String currentChar;

  void lex() {
    var checkText = '';
    for (var i = 0; i < text.length; i++)
      if (checkText[i] == '-' && checkText[i] == '.') checkText += checkText[i];
    string2int(checkText);
  }
}
