import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/image_provider.dart';
import 'views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ImageProviderCustom>(
      create: (_) => ImageProviderCustom(),
      child: MaterialApp(
        theme: ThemeData(
          accentColor: Colors.amberAccent,
          primaryColor: Colors.blueGrey[700],
          splashColor: Colors.yellowAccent,
        ),
        routes: {
          '/': (ctx) => HomePage(),
        },
      ),
    );
  }
}
