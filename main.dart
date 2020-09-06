import 'aaff.dart';
import 'string2int.dart';

void main(List<String> argv) async {
  if (argv.isEmpty) return;
  print((await AaffFile.read(argv.first)).decode());
}
