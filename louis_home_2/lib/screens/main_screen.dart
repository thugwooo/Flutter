import 'package:flutter/material.dart';
import 'package:louis_home_2/data/style.dart';
import 'package:louis_home_2/data/surveyData.dart';
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
      appBar: mainAppBar,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            button('신규 회원', RegisterScreen()),
            button('기존 회원', LoginScreen()),
          ],
        ),
      ),
    );
  }

  Widget button(var text, var nav) {
    return InkWell(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(0, 36, 79, 1),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30,
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
