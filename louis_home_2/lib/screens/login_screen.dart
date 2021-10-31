import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:louis_home_2/data/petfood.dart';
import 'package:louis_home_2/data/style.dart';
import 'package:louis_home_2/data/surveyData.dart';
import 'package:louis_home_2/screens/survey_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var userData = {
    "name": "",
    "phoneNumber": "",
    "pet": "",
    "breed": "",
    "birthYear": "2021",
    "birthMonth": "1",
    "birthDay": "1",
    "sex": "0",
    "neu": "0",
    "weight": "0",
    "bcs": "0",
    "alg": [],
    "health": [],
  };

  Future<dynamic> getUserData(url) async {
    var url2 = Uri.parse(url);
    var tmpAlg, tmpHealth;
    var algList = [];
    var healthList = [];
    Response response = await get(url2);

    if (response.statusCode == 200) {
      var pasingData = jsonDecode(utf8.decode(response.bodyBytes));
      for (var i = 0; i < pasingData.length; i++) {
        if (userData['name'] == pasingData[i]['name'] &&
            userData['phoneNumber'] == pasingData[i]['phoneNumber']) {
          userData['pet'] = pasingData[i]['pet'];
          userData['breed'] = pasingData[i]['breed'];
          userData['birthYear'] = pasingData[i]['birthYear'];
          userData['birthMonth'] = pasingData[i]['birthMonth'];
          userData['birthDay'] = pasingData[i]['birthDay'];
          userData['sex'] = pasingData[i]['sex'];
          userData['neu'] = pasingData[i]['neu'];
          userData['weight'] = pasingData[i]['weight'];
          userData['bcs'] = pasingData[i]['bcs'];
          tmpAlg = userData['pet'] == '강아지' ? dogAlg : catAlg;
          tmpHealth = userData['pet'] == '강아지' ? dogHealth : catHealth;
          for (var j = 0; j < tmpAlg.length; j++) {
            if (pasingData[i]['alg'].contains(tmpAlg[j])) {
              algList.add(tmpAlg[j]);
            }
          }
          userData['alg'] = algList;
          for (var j = 0; j < tmpHealth.length; j++) {
            if (pasingData[i]['health'].contains(tmpHealth[j])) {
              healthList.add(tmpHealth[j]);
            }
          }
          userData['health'] = healthList;
          break;
        }
      }
      print(userData['alg']);

      return userData;
    } else {
      print(response.statusCode);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar,
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Image.asset(
                'images/png/루이스홈 로고BLUE.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              textFormName(),
              textFormPhoneNumber(),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFormName() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //blueLogo,
          SizedBox(
            width: 10,
          ),
          Text(
            '반 려 동 물   이 름',
            style: smallStyle,
          ),
          SizedBox(
            width: 40,
          ),
          SizedBox(
            width: 200,
            height: 40,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              onSaved: (value) {
                userData['name'] = value!;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget textFormPhoneNumber() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //blueLogo,
          SizedBox(
            width: 10,
          ),
          Text(
            '휴  대  폰     번  호',
            style: smallStyle,
          ),
          SizedBox(width: 40),
          SizedBox(
            width: 200,
            height: 40,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              onSaved: (value) {
                userData["phoneNumber"] = value!;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: Text('제출'),
      style: ElevatedButton.styleFrom(primary: Colors.grey),
      onPressed: () {
        _formKey.currentState!.save();
        userData['pet'] == '강아지'
            ? userData['breed'] = '그레이트 데인'
            : userData['breed'] = '데본렉스';

        getUserData(
                'http://ec2-3-23-100-115.us-east-2.compute.amazonaws.com:8000/server/getuserData/')
            .then((value) => userData = value)
            .whenComplete(() =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SurveyScreen(
                    userData: userData,
                  );
                })));
        print(userData);
      },
    );
  }
}
