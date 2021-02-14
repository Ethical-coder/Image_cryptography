import 'dart:io' as Io;

encryption(image) {
  final bytes = Io.File(image).readAsBytesSync();
  for (int i = 0; i < bytes.length; i++) {
    bytes[i] = (bytes[i] + 100) % 256;
  }
  ;
  int last_index = 0;
  for (int i = 0; i < image.length; i++) {
    if (image[i] == "/") {
      last_index = i;
    }
  }
  var path = image.substring(0, last_index + 1) + "new_photo.jpg";

  final file = Io.File(path).writeAsBytesSync(bytes);

  return file;
}
