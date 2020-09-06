import 'string2int.dart';

//LEXICAL ANALYZER
class Lexer {
  Lexer(this.text);

  final String text;
  static final _dash = '-'.codeUnitAt(0), _dot = '.'.codeUnitAt(0);

  List<int> lex() {
    var checkText = '';
    for (var i = 0; i < text.length; i++) {
      var codeUnit = text.codeUnitAt(i);
      if (codeUnit == _dash || codeUnit == _dot) checkText += text[i];
    }
    return string2int(checkText);
  }
}
