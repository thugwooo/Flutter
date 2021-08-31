import 'package:flutter/material.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> comments = <String>[
    '첫번째 사료',
    '두번째 사료',
    '음악 라이브러리 공유',
    '뮤직비디오 업로드',
    '뮤직비디오 공유 무제한'
  ];

  final List<IconData> icons = <IconData>[
    Icons.food_bank,
    Icons.food_bank_outlined,
    Icons.food_bank_rounded,
    Icons.food_bank_sharp,
    Icons.video_library
  ];

  final List<String> wons = <String>[
    "5,000",
    "7,000",
    "9,000",
    "10,000",
    "15,000",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Nested ListView Example')),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new Container(
              height: 80.0,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: new List.generate(100, (int index) {
                  return new Card(
                    color: Colors.blue[index * 100],
                    child: new Container(
                      width: 50.0,
                      height: 50.0,
                      child: new Text("$index"),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
