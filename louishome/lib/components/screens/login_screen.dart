import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:louishome/components/screens/cat_screen.dart';
import 'package:louishome/components/screens/dog_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var phoneNumber;
  var name;
  var userData;
  Future<dynamic> getUserData(url) async {
    var url2 = Uri.parse(url);

    Response response = await get(url2);

    if (response.statusCode == 200) {
      var pasingData = jsonDecode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < pasingData.length; i++) {
        if (name == pasingData[i]['name'] &&
            phoneNumber == pasingData[i]['phoneNumber']) {
          userData = pasingData[i];
        }
      }
      return userData;
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('고르시오.'),
        leading: Image.asset(
          'images/png/LOGO-WHITE.png',
          height: 100,
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 36, 79, 1),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset(
                      'images/png/LOGO-BLUE.png',
                      width: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '반려동물  이름',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 40),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (value) {
                          name = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset(
                      'images/png/LOGO-BLUE.png',
                      width: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '휴 대 폰  번 호',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 40),
                    SizedBox(
                      width: 200,
                      height: 40,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '휴대폰 번호',
                        ),
                        keyboardType: TextInputType.phone,
                        onSaved: (value) {
                          phoneNumber = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('제출'),
                onPressed: () {
                  _formKey.currentState!.save();
                  getUserData('http://10.0.2.2:8000/server/getuserData/');

                  if (userData['pet'] == '강아지') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DogScreen(
                        userData: userData,
                      );
                    }));
                  } else if (userData['pet'] == '고양이') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CatScreen(
                        userData: userData,
                      );
                    }));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
