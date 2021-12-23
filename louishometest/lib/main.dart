import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:louishometest/data/style.dart';
import 'package:louishometest/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Louis',
      theme: ThemeData(fontFamily: font),
      home: MainScreen(),
    );
  }
}
