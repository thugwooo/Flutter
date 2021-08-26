import 'package:flutter/material.dart';
import 'survey.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'pet tailor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Survey(),
                      ),
                    );
                  },
                  child: Text(
                    '신규고객',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(minimumSize: Size(200, 100)),
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '기존고객',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 100),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
