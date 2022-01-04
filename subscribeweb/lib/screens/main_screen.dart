import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:subscribeweb/data/style.dart';
import 'package:subscribeweb/data/userListData.dart';
import 'package:subscribeweb/screens/info_screen.dart';
import 'package:subscribeweb/screens/subscription_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var indexedButton = 0;

  var baseUrl = 'http://18.188.38.27:8000/userdata/list/';
  Future<dynamic> getUserList() async {
    var url2 = Uri.parse(baseUrl);

    Response response = await get(
      url2,
    );
    data = jsonDecode(utf8.decode(response.bodyBytes));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 20),
              upperButton(),
              SizedBox(height: 20),
              Divider(
                thickness: 2,
                color: Colors.black,
              ),
              IndexedStack(
                index: indexedButton,
                children: [
                  subscriptionScreen(),
                  infoScreen(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget upperButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              indexedButton = 0;
            });
          },
          child: Container(
            child: Text(
              '구독하기',
              style: infoStyle,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              getUserList().then((value) {
                setState(() {
                  indexedButton = 1;
                });
              });
            });
          },
          child: Container(
            child: Text(
              '구독정보',
              style: infoStyle,
            ),
          ),
        ),
      ],
    );
  }
}
