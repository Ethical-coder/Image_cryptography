import "package:flutter/material.dart";

import './decryption_page.dart';
import './encryption_page.dart';

class HomePage extends StatelessWidget {
  
  void routeChanger(ctx, route) {
    Navigator.of(ctx).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Cryptography App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Expanded>[
          Expanded(
              flex: 2,
              child: SizedBox(
                height: 100,
              )),
          Expanded(
            flex: 2,
            child: InkWell(
              radius: 10,
              splashColor: Colors.yellowAccent,
              onTap: () => {
                routeChanger(context, EncryptionPage.routeName),
              },
              child: Container(
                child: Text("Encryption"),
                color: Colors.blueAccent,
                margin: EdgeInsets.all(3),
                alignment: Alignment.center,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: SizedBox(
                height: 100,
              )),
          Expanded(
            flex: 2,
            child: InkWell(
              radius: 10,
              splashColor: Colors.yellowAccent,
              onTap: () => {
                routeChanger(context, DecryptionPage.routeName),
              },
              child: Container(
                child: Text("Decryption"),
                color: Colors.red,
                margin: EdgeInsets.all(3),
                alignment: Alignment.center,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: SizedBox(
                height: 100,
              )),
        ],
      ),
    );
  }
}
