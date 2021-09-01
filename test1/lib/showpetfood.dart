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
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
