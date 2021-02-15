import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../Logic/image_encryption.dart';

class ImageToEncrypt extends StatefulWidget {
  @override
  _ImageToEncryptState createState() => _ImageToEncryptState();
}

class _ImageToEncryptState extends State<ImageToEncrypt> {

  File storedImage;
  File imageTransfer;

  Future<void> openCamera() async {
    final picker = ImagePicker();
    final imagefile = await picker.getImage(source: ImageSource.camera);
    encryption(imagefile.path);
    setState(() {
      storedImage = File(imagefile.path);
    });
  }

  Future<void> openGallery() async {
    final picker = ImagePicker();
    final imagefile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      storedImage = File(imagefile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: storedImage == null
              ? Text("Image not yet Uploaded")
              : Image.file(
                  storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
          height: 300,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          color: Colors.grey,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: FlatButton.icon(
                  onPressed: openCamera,
                  icon: Icon(
                    Icons.camera,
                    color: Colors.blue,
                  ),
                  label: Text(
                    "Camera",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: FlatButton.icon(
                  onPressed: openGallery,
                  icon: Icon(
                    Icons.image,
                    color: Colors.blue,
                  ),
                  label: Text(
                    "Galery",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
