import "package:flutter/material.dart";

class home_page extends StatelessWidget {
  @override
  String en_route = "/encryption_page";
  String de_route = "/decryption_page";
  Function route_changer(ctx, route) {
    Navigator.of(ctx).pushNamed(route);
  }

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
                route_changer(context, en_route),
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
                route_changer(context, de_route),
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
