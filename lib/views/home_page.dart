import "package:flutter/material.dart";

import '../widgets/image_to_encrypt.dart';
import './decryption_page.dart';
import './encryption_page.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Map<String, Object>> _pages = [
    {
      'page':EncryptionPage(), 
      'title':'Encrypt'
    },
    {
      'page': DecryptionPage(), 
      'title':'Decrypt'
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Cryptography App"),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
          children: <Widget>[
            Expanded(
              child: ImageToEncrypt(),
              flex: 2, 
            ),
            Expanded(child: this._pages[_selectedPageIndex]['page'], flex: 3,),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: this._selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_outline_rounded), label: "Encrypt",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_open), label: "Decrypt",
          ),
        ],
      ),
    );
  }
}
