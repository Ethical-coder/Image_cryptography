import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as imgModel;
import 'dart:io';
import 'data_models.dart' as dataModel;

// This is the model class for the provider to use. Do not change it without consulting.
class ImageObject {
  String path;
  imgModel.Image image_object;
}

class ImageProviderCustom with ChangeNotifier {
  ImageObject img = ImageObject();

  String imagePath() {
    return this.img?.path;
  }

  void updateImage(String path) {
    //TODO: Add Validations
    img.path = path;
    //TODO: Add code to generate byte array.

    notifyListeners();
  }

  void encryptImage(String message,
      {String key = dataModel.EncDecTables.default_key}) {
    //TODO: Implement Encryption.
  }

  String decryptImage({String key = dataModel.EncDecTables.default_key}) {
    //TODO: Implement Decryption.
  }
}
