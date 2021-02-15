import 'package:flutter/material.dart';

import 'views/home_page.dart';
import 'views/encryption_page.dart';
import "views/decryption_page.dart";
// ignore: unused_import
import "views/final_decrypted_page.dart";
import 'views/final_encrypted_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => HomePage(),
        "/encryption_page": (ctx) => EncryptionPage(),
        "/decryption_page": (ctx) => DecryptionPage(),
        "/final_encrypted_page": (ctx) => FinalEncryptedPage(),
        //  "/final_encrypted_page": (ctx) => FinalDecryptionPage(),
      },
    );
  }
}
