import 'dart:io' as Io;
import 'package:path_provider/path_provider.dart' as syspath;

encryption(image) {
  final bytes = Io.File(image).readAsBytesSync();

  for (int i = 0; i < bytes.length; i++) {
    bytes[i] = (bytes[i] + 100) % 256;
  }
  final custom = syspath.getApplicationDocumentsDirectory();
  print(custom);
  print(custom.toString());
  return;
  //final path = "${cust}/new_photo.png";
  //final file = Io.File(path).writeAsBytesSync(bytes);

  //return file;
}
