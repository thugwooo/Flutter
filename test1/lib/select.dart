import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  const Select({Key? key}) : super(key: key);

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  final formKey = GlobalKey<FormState>();
  final List<Color> colorData = [Colors.amber, Colors.red];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('고양이'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('강아지'),
            ),
          ],
        ),
      ),
    );
  }
}
