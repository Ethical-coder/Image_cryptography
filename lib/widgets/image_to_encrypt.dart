import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../providers/image_provider.dart';
import 'package:provider/provider.dart';

class ImageToEncrypt extends StatelessWidget {
  Future<void> openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final imagefile = await picker.getImage(source: ImageSource.camera);
    Provider.of<ImageProviderCustom>(context, listen: false)
        .updateImage(imagefile.path);
  }

  Future<void> openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final imagefile = await picker.getImage(source: ImageSource.gallery);
    Provider.of<ImageProviderCustom>(context, listen: false)
        .updateImage(imagefile.path);
  }

  @override
  Widget build(BuildContext context) {
    final pth = Provider.of<ImageProviderCustom>(context).imagePath();

    return Column(
      children: [
        Container(
          width: double.infinity,
          child: pth == null
              ? Text("Image not yet Uploaded")
              : Image.file(
                  File(pth),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
          height: MediaQuery.of(context).size.height * 0.2,
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
                  onPressed: () => openCamera(context),
                  icon: Icon(
                    Icons.camera,
                    color: Theme.of(context).accentColor,
                  ),
                  label: Text(
                    "Camera",
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: FlatButton.icon(
                  onPressed: () => openGallery(context),
                  icon: Icon(
                    Icons.image,
                    color: Theme.of(context).accentColor,
                  ),
                  label: Text(
                    "Gallery",
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
