import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:louishomewebtest/screens/main_screen.dart';

import 'data/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: font,
        primaryColor: colors[0],
      ),
      home: MainScreen(),
    );
  }
}
