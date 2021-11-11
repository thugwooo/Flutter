import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:louishomedisplay/assets/style.dart';
import 'package:louishomedisplay/screens/main_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    return MaterialApp(
      theme: ThemeData(primaryColor: colors[0], fontFamily: font),
      home: MainScreen(),
    );
  }
}
