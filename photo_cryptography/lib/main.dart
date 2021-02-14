import 'package:flutter/material.dart';
import 'package:photo_cryptography/Pages/final_encrypted_page.dart';
import 'Pages/home_page.dart';
import 'Pages/encryption_page.dart';
import "Pages/decryption_page.dart";
import "Pages/final_decrypted_page.dart";
import 'Pages/final_encrypted_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => home_page(),
        "/encryption_page": (ctx) => encryption_page(),
        "/decryption_page": (ctx) => decryption_page(),
        "/final_encrypted_page": (ctx) => final_encrypted_page(),
        //  "/final_encrypted_page": (ctx) => decryption_page(),
      },
    );
  }
}
