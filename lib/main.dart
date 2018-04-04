import 'package:flutter/material.dart';
import 'package:hello_world/Pages/initiate-page.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData.light(),
      home: new InitiateAppPage(),
      builder: (BuildContext context, Widget child) {
        return new Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
    );
  }
}
