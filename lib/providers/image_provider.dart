import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as imgModel;
import 'dart:io';
import 'data_models.dart' as dataModel;

// This is the model class for the provider to use. Do not change it without consulting.
class ImageObject {
  String path;
  imgModel.Image imageObject;
}

class ImageProviderCustom with ChangeNotifier {
  
  ImageObject img = ImageObject();
  String currentKey = dataModel.EncDecTables.default_key;

  void resetKey() => this.currentKey = dataModel.EncDecTables.default_key;
  void setKey(String customKey) => this.currentKey = customKey;

  String imagePath() {
    return this.img?.path;
  }

  void updateImage(String path) {
    //TODO: Add Validations
    img.path = path;
    notifyListeners();
  }

  void encryptImage(String message,{String key = dataModel.EncDecTables.default_key}) {
    //TODO: Implement Encryption.
  }

  String decryptImage({String key = dataModel.EncDecTables.default_key}) {
    //TODO: Implement Decryption.
    return "Example";
  }
}
