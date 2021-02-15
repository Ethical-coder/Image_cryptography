import 'package:flutter/material.dart';
import '../widgets/image_to_encrypt.dart';
import 'dart:io';

class EncryptionPage extends StatelessWidget {

  static const routeName = "/encryption_page";

  encryptMessage(ctx, rt, message) {
    Navigator.of(ctx)
        .pushNamed("/final_encrypted_page", arguments: {"message": message});
  }

  var message = TextEditingController();
  final String route = "/final_encrypted_page";
  File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Encryption"),
      ),
      body: ListView(
        children: [
          Container(
              child: Text(
                "Enter Image to be Encrypted",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 45, bottom: 20)),
          ImageToEncrypt(),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text("Enter Your Message"),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: message,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              alignment: Alignment.center,
              color: Colors.blueAccent,
              width: double.infinity,
              height: 50,
              child: InkWell(
                onTap: () => encryptMessage(context, route, message.text),
                splashColor: Colors.yellowAccent,
                child: Text(
                  "Encrypt the message",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
    );
  }
}
