import 'package:flutter/material.dart';

class ShowPetfood extends StatefulWidget {
  const ShowPetfood({Key? key}) : super(key: key);

  @override
  _ShowPetfoodState createState() => _ShowPetfoodState();
}

class _ShowPetfoodState extends State<ShowPetfood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('사료 보기')),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 100, 10, 0),
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(10),
          // 1. 리스트뷰 생성하고
          children: <Widget>[
            Container(
              width: 100,
              color: Colors.blue,
            ),
            Container(
              width: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              color: Colors.blue,
            ),
            Container(
              width: 100,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
