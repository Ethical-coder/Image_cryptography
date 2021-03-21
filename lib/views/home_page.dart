import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../providers/image_provider.dart';
import '../widgets/image_to_encrypt.dart';
import './decryption_page.dart';
import './encryption_page.dart';

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
  final encKey = TextEditingController();
  bool useCustomKey = false;

  void changeKey(bool val) {
    var provd = Provider.of<ImageProviderCustom>(context, listen: false);
    if (val && encKey.text!="")
      provd.setKey(encKey.text);
    else
      provd.resetKey();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stegnographer"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: ImageToEncrypt(),
            ),
            Expanded(
                flex: 1,
                child: ListTile(
                  title: (useCustomKey == false)
                      ? Text("Use custom encryption key",style: TextStyle(color: Colors.grey))
                      : TextField(
                          maxLines: 1,
                          onChanged: (_){ 
                            if(encKey.text.length>20)
                              encKey.text = encKey.text.substring(0,20);
                            this.changeKey(true);
                          },
                          controller: encKey,
                          maxLength: 20,
                          maxLengthEnforced: true,
                        ),
                  trailing:Switch(
                    activeColor: Theme.of(context).accentColor,
                    value: useCustomKey,
                    onChanged: (value) {
                      setState(() {
                        this.changeKey(value);
                        useCustomKey = value;
                      });
                    },
                  ),
                )),
            Divider(),
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
