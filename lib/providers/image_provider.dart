import 'package:flutter/foundation.dart';

// This is the model class for the provider to use. Do not change it without consulting.
class ImageObject{
  String path;
  List<int> byteArray;
  int size;
}

class ImageProviderCustom with ChangeNotifier{
  ImageObject img = ImageObject();

  String imagePath(){
    return this.img?.path;
  }

  void updateImage(String path){
    //TODO: Add Validations
    img.path = path;
    //TODO: Add code to generate byte array.
    notifyListeners();
  }

  void encryptImage(String message){
    //TODO: Implement Encryption.
  }

  String decryptImage(){
    //TODO: Implement Decryption.
  }
}