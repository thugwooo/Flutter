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
  final formKey = GlobalKey<FormState>();
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
    String ID = "";
    String password = "";
    return Scaffold(
      body: Center(
        child: Form(
          key: this.formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Name *',
                ),
                onSaved: (String? value) {
                  ID = value!;
                  print(ID);
                },
                validator: (value) {
                  return value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Password *',
                ),
                onSaved: (String? value) {
                  password = value!;
                  print(password);
                },
                validator: (value) {
                  return value;
                },
              ),
              SizedBox(
                height: 10,
              ),
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
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final form = formKey.currentState;
                      form!.save();
                      print(ID + password);
                      sendData({'name': ID, 'pw': password});
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
      ),
    );
  }
}
