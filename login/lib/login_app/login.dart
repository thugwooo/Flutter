import 'package:flutter/material.dart';
import 'package:login/my_button/my_button.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Sign In",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: _buildButton(),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyButton(
            image: Image.asset(
              'images/glogo.png',
            ),
            text: Text(
              "Login with Google",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
            color: Colors.white,
            radius: 30,
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          MyButton(
            image: Image.asset('images/flogo.png'),
            text: Text(
              'Login wiht Facebook',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            color: Colors.blue,
            radius: 100,
            onPressed: () {},
          ),
          SizedBox(
            height: 10,
          ),
          MyButton(
            image: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            text: Text(
              'Login with Email',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            color: Colors.green,
            radius: 10,
            onPressed: () {},
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
