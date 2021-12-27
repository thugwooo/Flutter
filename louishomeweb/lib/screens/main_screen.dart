import 'package:flutter/material.dart';
import 'package:louishomeweb/data/style.dart';
import 'package:louishomeweb/screens/subscribe_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height,
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              subscribeScreen(_selectedIndex),
            ],
          ),
        ),
      ),
    );
  }
}
