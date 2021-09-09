import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as imgModel;
import 'dart:io' as io;
import 'data_models.dart' as dataModel;
import 'package:path_provider/path_provider.dart' as syspath;
//import 'package:path/path.dart' as path;

// This is the model class for the provider to use. Do not change it without consulting.
class ImageObject {
  String? path;
  imgModel.Image? imageObject;
}

class ImageProviderCustom with ChangeNotifier {
  ImageObject img = ImageObject();
  String currentKey = dataModel.EncDecTables.default_key;

  void resetKey() => this.currentKey = dataModel.EncDecTables.default_key;
  void setKey(String customKey) => this.currentKey = customKey;

  String? imagePath() {
    return this.img.path;
  }

  void updateImage(String path) {
    //TODO: Add Validations
    img.path = path;
    notifyListeners();
  }

  Future<void> encryptImage(String message) async {
    //TODO: Implement Encryption.
    try {
      print("encoding image");
      this.img.imageObject =
          imgModel.decodeImage(io.File(img.path.toString()).readAsBytesSync());
      int length = message.length;

      this
          .img
          .imageObject!
          .setPixel(0, 0, dataModel.EncDecTables.enc_map["SOS"]);
      var msgVal;
      var keyVal;
      var encryptedKey;
      int i = 0, j = 1, counter = 1;
      while (counter <= length) {
        var pixel = this.img.imageObject!.getPixel(i, j);

        pixel = pixel & dataModel.EncDecTables.enc_mask;
        keyVal = dataModel.EncDecTables
            .enc_map[currentKey[(counter - 1) % currentKey.length]];
        msgVal = dataModel.EncDecTables.enc_map[message[counter - 1]];
        encryptedKey = (keyVal + msgVal) % 128;

        var finalPixel = pixel | encryptedKey;
        this.img.imageObject!.setPixel(i, j, finalPixel);
        counter += 1;
        i = (counter / 50).toInt();
        j = counter % 50;
      }

      //adding end of string signal
      var pixel = this.img.imageObject!.getPixel(i, j);

      pixel = pixel & dataModel.EncDecTables.enc_mask;
      keyVal = dataModel
          .EncDecTables.enc_map[currentKey[(counter - 1) % currentKey.length]];
      msgVal = dataModel.EncDecTables.enc_map["EOS"];
      encryptedKey = (keyVal + msgVal) % 128;

      var finalPixel = pixel | encryptedKey;
      this.img.imageObject!.setPixel(i, j, finalPixel);

      //converting image back to file
      final io.File encImage = io.File(this.img.path.toString());
      encImage.writeAsBytesSync(imgModel.encodePng(this.img.imageObject));
      //fetching path to store image
      '''final appdir = await syspath.getApplicationDocumentsDirectory();
      final String newPath = appdir.path;
      var paths = (img.path).split("/");''';
      //final finalPath = "${newPath.toString()}/${paths[paths.length - 1]}";
      final finalPath =
          "/storage/emulated/0/Android/data/com.example.photo_cryptography/files/Pictures/new.png";
      final _ = encImage.copy(finalPath);
      print(finalPath);
      print("done");
    } catch (e) {
      print(
          "Can't use special characters like \$ , \\ and enter in message and key");
    }
  }

  String decryptImage() {
    print("decoding image");
    this.img.imageObject =
        imgModel.decodeImage(io.File(img.path.toString()).readAsBytesSync());
    var checkVal = (this.img.imageObject!.getPixel(0, 0)) &
        dataModel.EncDecTables.dec_mask;
    if (checkVal == dataModel.EncDecTables.enc_map["SOS"]) {
      try {
        int i = 0, j = 1, counter = 1;
        String message = "";
        int curPixel = ((this.img.imageObject!.getPixel(0, 1)) &
                dataModel.EncDecTables.dec_mask) -
            dataModel.EncDecTables.enc_map[currentKey[0]]!.toInt();
        if (curPixel < 0) {
          curPixel += 128;
        }

        while (curPixel != dataModel.EncDecTables.enc_map["EOS"] &&
            counter < 2500) {
          message =
              message + dataModel.EncDecTables.dec_map[curPixel].toString();
          counter += 1;
          i = (counter / 50).toInt();
          j = counter % 50;
          var encValue = (this.img.imageObject!.getPixel(i, j)) &
              dataModel.EncDecTables.dec_mask;
          var keyValue = dataModel.EncDecTables
              .enc_map[currentKey[(counter - 1) % currentKey.length]];
          curPixel = encValue - keyValue!;
          if (curPixel < 0) {
            curPixel += 128;
          }
        }
        return (message);
      } catch (e) {
        return ("Check the key");
      }
    } else {
      return ("This image is not encrypted with any message");
    }
  }
}
