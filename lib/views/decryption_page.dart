import 'package:flutter/material.dart';
import 'package:photo_cryptography/providers/image_provider.dart';

import 'package:provider/provider.dart';

class DecryptionPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    void decryptImage(BuildContext context){
      final message = Provider.of<ImageProviderCustom>(context, listen: false).decryptImage();
    }

    return SingleChildScrollView(child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            width: MediaQuery.of(context).size.width*0.55,
              child: InkWell(
                child: ListTile(
                  leading: Icon(Icons.lock_open),
                  title: Text("Decrypt Image", textAlign: TextAlign.center,style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
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
