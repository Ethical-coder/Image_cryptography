import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/image_provider.dart';

class EncryptionPage extends StatelessWidget {

  static const routeName = "/encryption_page";
  final messageController = TextEditingController();
  
  encryptMessage(BuildContext context,String message) {
    Provider.of<ImageProviderCustom>(context).encryptImage(message);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text("Enter Your Message"),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: messageController,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50, left: 20, right: 20),
          alignment: Alignment.center,
          color: Theme.of(context).accentColor,
          width: double.infinity,
          height: 50,
          child: InkWell(
            onTap: () => encryptMessage(context, messageController.text),
            splashColor: Theme.of(context).splashColor,
            child: Text(
              "Encrypt the message",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ),
      ],
    );
  }
}