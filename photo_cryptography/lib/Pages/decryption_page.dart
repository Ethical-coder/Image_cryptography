import 'package:flutter/material.dart';
import 'dart:io';
import '../widget/image.dart';

class decryption_page extends StatelessWidget {
  @override
  File stored_image = null;

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
          image(),
        ],
      ),
    );
  }
}
