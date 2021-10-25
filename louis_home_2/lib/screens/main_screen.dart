import 'package:flutter/material.dart';
import 'package:louis_home_2/data/style.dart';

import 'package:louis_home_2/screens/login_screen.dart';
import 'package:louis_home_2/screens/register_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors[0],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Image.asset(
              'images/png/루이스홈 로고BLUE.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button('기존 회원', LoginScreen()),
                button('신규 회원', RegisterScreen()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button(var text, var nav) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width * 0.27,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(0, 36, 79, 1),
            width: 5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return nav;
        }));
      },
    );
  }
}
