import 'package:flutter/material.dart';
import 'package:practice/data/network.dart';

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
  @override
  void initState() {
    super.initState();
    getData();
  }

  var nameData;
  void getData() async {
    Network network = Network('https://dj-fl.herokuapp.com/app1/3/');
    nameData = await network.getJsonData();
    print(nameData);
  }

  void sendData(dynamic sendData) async {
    Network network =
        Network('https://dj-fl.herokuapp.com/app1/inputUserInfo/');
    await network.postJsonData(sendData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    getData();
                  },
                  child: Text('꺄항'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    sendData({'id': 'asdf', 'name': 'qwer'});
                  },
                  child: Text('보내기'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
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
