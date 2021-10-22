import 'package:flutter/material.dart';

import 'package:louishome/components/screens/register_screen.dart';

import 'login_screen.dart';

class CheckScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Louis home'),
        leading: Image.asset(
          'images/png/LOGO-WHITE.png',
          height: 100,
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 36, 79, 1),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Container(
                margin: EdgeInsets.only(left: 40),
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(0, 36, 79, 1),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    '신규회원',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegisterScreen();
                }));
              },
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.only(right: 40),
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(0, 36, 79, 1),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    '기존회원',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
