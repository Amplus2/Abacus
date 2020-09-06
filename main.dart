import 'dart:convert';
import 'dart:io';
import 'lexer.dart' as Lexer;

void main(List<String> argv) async {
  Stream<List<int>> input = stdin;
  if (argv.isNotEmpty) input = File(argv.first).openRead();
  var allBytes = <int>[];
  await for (List<int> bytes in input) allBytes.addAll(bytes);
  print(Lexer.lex(utf8.decode(allBytes)).toList());
}
