import "package:flutter/material.dart";

import '../widgets/image_to_encrypt.dart';
import './decryption_page.dart';
import './encryption_page.dart';
import 'package:custom_switch/custom_switch.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, Object>> _pages = [
    {'page': EncryptionPage(), 'title': 'Encrypt'},
    {'page': DecryptionPage(), 'title': 'Decrypt'},
  ];

  int _selectedPageIndex = 0;
  //added
  var enc_key = TextEditingController();
  bool status = false;
  //end

  void _selectPage(int index) {
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
              flex: 4,
              child: ImageToEncrypt(),
            ),
            //added this----------------------------------------
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: (status == false)
                        ? Text("Using Default Key")
                        : TextField(
                            controller: enc_key,
                            maxLength: 20,
                            maxLengthEnforced: true,
                          ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: CustomSwitch(
                      activeColor: Colors.orangeAccent,
                      value: status,
                      onChanged: (value) {
                        setState(() {
                          status = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            //end),
            Expanded(
              child: this._pages[_selectedPageIndex]['page'],
              flex: 5,
            ),
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
            icon: Icon(Icons.lock_outline_rounded),
            label: "Encrypt",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_open),
            label: "Decrypt",
          ),
        ],
      ),
    );
  }
}
