import 'package:flutter/material.dart';
import 'package:stenographer/providers/image_provider.dart';

import 'package:provider/provider.dart';

class DecryptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    messageBox(message) {
      return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: Theme.of(context).primaryColor,
          scrollable: true,
          shape: Border.all(color: Theme.of(context).splashColor, width: 2),
          title: Text(
            "Message",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontStyle: FontStyle.italic,
            ),
          ),
          content: Text(
            message,
            style: TextStyle(color: Theme.of(context).splashColor),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("okay"),
            ),
          ],
        ),
      );
    }

    void decryptImage(BuildContext context) {
      final message = Provider.of<ImageProviderCustom>(context, listen: false)
          .decryptImage();
      messageBox(message);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              color: Theme.of(context).accentColor,
              width: MediaQuery.of(context).size.width * 0.55,
              child: InkWell(
                child: ListTile(
                  leading: Icon(Icons.lock_open),
                  title: Text(
                    "Decrypt Image",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () => decryptImage(context),
                ),
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 45, bottom: 20)),
        ],
      ),
    );
  }
}
