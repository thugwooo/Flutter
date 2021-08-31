import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class Data {
  int? ids;
  String? name;

  Data({this.ids, this.name});

  Data.fromMap(Map<String, dynamic> map)
      : ids = map['Ids'],
        name = map['name'];

  Data.fromJson(Map<String, dynamic> map)
      : ids = map['Ids'],
        name = map['name'];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var url = Uri.https('127.0.0.1:8000', '/app1/3');
  _fetch() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        var parsed = json.decode(utf8.decode(response.bodyBytes));
        print(parsed.map<Data>((json) => Data.fromJson(json)).toList());
        return parsed.map<Data>((json) => Data.fromJson(json)).toList();
      });
    } else {
      throw Exception('failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('제발.....'),
      ),
      body: ElevatedButton(
        onPressed: () {
          _fetch();
        },
        child: Text('버튼'),
      ),
    );
  }
}
