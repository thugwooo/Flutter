import 'package:flutter/material.dart';
import 'package:louishome/data/style.dart';
import 'package:louishome/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Louis-Home',
      theme: ThemeData(
        fontFamily: font,
      ),
      home: MainScreen(),
    );
  }
}
