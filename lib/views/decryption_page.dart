import 'package:flutter/material.dart';
import 'dart:io';
import '../widgets/image_to_encrypt.dart';

class DecryptionPage extends StatelessWidget {

  static const routeName = "/decryption_page";
  File storedImage;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Decrytpion"),
      ),
      body: Column(
        children: [
          Container(
              child: Text(
                "Enter Image to be Decrypted",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 45, bottom: 20)),
          ImageToEncrypt(),
        ],
      ),
    );
  }
}
