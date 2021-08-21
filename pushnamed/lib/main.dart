import 'package:flutter/material.dart';
import 'package:pushnamed/ScreenA.dart';
import 'package:pushnamed/ScreenB.dart';
import 'package:pushnamed/ScreenC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ScreenA(),
        '/b': (context) => ScreenB(),
        '/c': (context) => ScreenC(),
      },
    );
  }
}
