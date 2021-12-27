import 'package:flutter/material.dart';
import 'package:louishomeweb/data/style.dart';
import 'package:louishomeweb/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: font, primaryColor: colors[0]),
      home: MainScreen(),
    );
  }
}
