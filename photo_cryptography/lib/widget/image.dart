import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../Logic/image_encryption.dart';

class image extends StatefulWidget {
  @override
  _imageState createState() => _imageState();
}

class _imageState extends State<image> {
  @override
  File stored_image;
  File image_transfer;

  Future<void> open_camera() async {
    final picker = ImagePicker();
    final imagefile = await picker.getImage(source: ImageSource.camera);
    encryption(imagefile.path);
    setState(() {
      stored_image = File(imagefile.path);
    });
  }

  Future<void> open_gallery() async {
    final picker = ImagePicker();
    final imagefile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      stored_image = File(imagefile.path);
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: stored_image == null
              ? Text("Image not yet Uploaded")
              : Image.file(
                  stored_image,
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
                  onPressed: open_camera,
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
                  onPressed: open_gallery,
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
