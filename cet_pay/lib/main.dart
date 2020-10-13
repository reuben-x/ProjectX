import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignUpPage()
      },
      home: new MyHomePage(),
    );
  }
}

