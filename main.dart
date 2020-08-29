import 'dart:convert';
import 'dart:io';
import 'string2int.dart';

void main(List<String> argv) async {
  Stream<List<int>> input = stdin;
  if (argv.isNotEmpty) input = File(argv.first).openRead();
  var allBytes = <int>[];
  await for (List<int> bytes in input) allBytes.addAll(bytes);
  print(string2int(ascii.decode(allBytes)));
}
