import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<dynamic> postData(url) async {
    var url2 = Uri.parse(url);
    var data;

    Response response = await post(
      url2,
      body: {'chatStr': '안녕'},
    );
    print(jsonDecode(utf8.decode(response.bodyBytes))['chatStr']);
    //data = jsonDecode(utf8.decode(response.bodyBytes));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('클릭'),
                onPressed: () {
                  postData('http://18.223.235.142:8000/app1/model/');
                },
              ),
              Text('asdf'),
            ],
          ),
        ),
      ),
    );
  }
}
