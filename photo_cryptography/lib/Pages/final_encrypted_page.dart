import 'package:flutter/material.dart';

class final_encrypted_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context).settings.arguments;
    print(data["message"]);
    return Scaffold(
        appBar: AppBar(
          title: Text("Encrypted photo"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Decrypted Photo",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
                child: data["path"] == null
                    ? Text("No Image Is Inserted")
                    : Image.file(data["path"],
                        fit: BoxFit.cover, width: double.infinity),
                width: double.infinity,
                height: 300,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                margin: EdgeInsets.all(15),
                color: Colors.blueGrey),
            SizedBox(height: 10),
            Container(
              child: InkWell(
                onTap: null,
                splashColor: Colors.blueAccent,
                child: Text("Button to save the file"),
              ),
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.all(20),
              color: Colors.yellowAccent,
            ),
          ],
        ));
  }
}
