import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:louishome/data/data.dart';
import 'package:louishome/data/style.dart';
import 'package:louishome/data/surveyData.dart';
import 'package:louishome/screens/survery_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  var buttonName = ['신규회원', '기존회원'];
  var selectedNum = 0;
  var selectedPetId = 0;
  var userData;
  var nextFlag = true;
  var newFlag = true;
  @override
  void initState() {
    super.initState();
    userData = userInfo;
  }

  Future<dynamic> postUserData(url) async {
    var url2 = Uri.parse(url);
    var data;
    var tmpAlg;
    var tmpHealth;
    var algList = [];
    var healthList = [];
    Response response = await post(
      url2,
      body: {
        'name': userData['name'],
        'phoneNumber': userData['phoneNumber'],
      },
    );
    if (selectedNum == 0) {
      if (response.statusCode == 200) {
        data = jsonDecode(utf8.decode(response.bodyBytes));
        if (data == 'info doesnot exist error') {
          newFlag = false;
        } else if (data['pet'] == userData['pet'] &&
            data['phoneNumber'] == userData['phoneNumber']) {
          newFlag == true;
        }
      } else {
        print('falied');
      }
    } else {
      if (response.statusCode == 200) {
        data = jsonDecode(utf8.decode(response.bodyBytes));

        nextFlag = data != 'info doesnot exist error';
        if (nextFlag) {
          userData['name'] = data['name'];
          userData['phoneNumber'] = data['phoneNumber'];
          userData['pet'] = data['pet'];
          userData['breed'] = data['breed'];
          userData['birthYear'] = data['birthYear'];
          userData['birthMonth'] = data['birthMonth'];
          userData['birthDay'] = data['birthDay'];
          userData['sex'] = data['sex'];
          userData['neu'] = data['neu'];
          userData['bcs'] = data['bcs'];
          userData['weight'] = data['weight'];
          userData['petfood'] = data['petfood'].split(',');

          tmpAlg = userData['pet'] == '강아지' ? dogAlg : catAlg;
          tmpHealth = userData['pet'] == '강아지' ? dogHealth : catHealth;

          for (var i = 0; i < tmpAlg.length; i++) {
            if (data['alg'].contains(tmpAlg[i])) {
              algList.add(tmpAlg[i]);
            }
          }
          userData['alg'] = algList;
          for (var i = 0; i < tmpHealth.length; i++) {
            if (data['health'].contains(tmpHealth[i])) {
              healthList.add(tmpHealth[i]);
            }
          }
          userData['health'] = healthList;
          print('finish save');
          print(userData);
        }
      } else {
        print('falied');
        nextFlag = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar,
      body: Form(
        key: _formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                LOGO(),
                buttons(),
                infoscreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget LOGO() {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.12,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: blueLogo(MediaQuery.of(context).size.width * 0.1),
    );
  }

  Widget buttons() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          typebutton(0),
          SizedBox(
            width: 20,
          ),
          typebutton(1),
        ],
      ),
    );
  }

  Widget typebutton(var index) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          border: Border.all(
            width: 4,
            color: selectedNum == index ? colors[0] : colors[1],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonName[index].toString(),
            style: TextStyle(
              fontSize: 30,
              fontWeight: selectedNum == index ? bold[0] : bold[1],
              color: selectedNum == index ? colors[0] : colors[1],
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selectedNum = index;
        });
      },
    );
  }

  Widget infoscreen() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: MediaQuery.of(context).size.width * 0.5 + 20,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: [
          inputName(),
          inputPhoneNumber(),
          SizedBox(height: 20),
          if (selectedNum == 0) inputPet(),
          submitButton(),
        ],
      ),
    );
  }

  Widget inputName() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '반 려 동 물  이 름',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.04,
            child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  userData['name'] = value;
                }),
          ),
        ],
      ),
    );
  }

  Widget inputPhoneNumber() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '휴 대 전 화  번 호',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.04,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                userData['phoneNumber'] = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget inputPet() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        petbutton(0),
        SizedBox(width: 20),
        petbutton(1),
      ],
    ));
  }

  Widget petbutton(var index) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.04,
        decoration: BoxDecoration(
          border: Border.all(
            width: 4,
            color: selectedPetId == index ? colors[0] : colors[1],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            pet[index],
            style: TextStyle(
              fontWeight: selectedPetId == index ? bold[0] : bold[1],
              fontSize: 20,
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          selectedPetId = index;
          userData['pet'] = pet[selectedPetId];
        });
      },
    );
  }

  Widget submitButton() {
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.04,
          ),
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.04,
          decoration: line,
          child: Center(
            child: Text(
              '다 음',
              style: TextStyle(
                fontWeight: bold[0],
                fontSize: 20,
              ),
            ),
          ),
        ),
        onTap: () {
          _formKey.currentState!.save();
          userData['breed'] = userData['pet'] == '강아지' ? '그레이트 데인' : '데본렉스';
          postUserData('http://3.22.236.33:8000/app1/login/')
              .then((value) => search());
        });
  }

  dynamic search() {
    print(selectedNum);
    if (selectedNum == 0) {
      if (newFlag) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('등록된 회원입니다.'),
        ));
      } else {
        userData['pet'] = pet[selectedPetId];
        userData['breed'] = userData['pet'] == '강아지' ? '그레이트 데인' : '데본렉스';
        userData['birthYear'] = '2021';
        userData['birthMonth'] = '1';
        userData['birthDay'] = '1';
        userData['sex'] = 0;
        userData['neu'] = 0;
        userData['weight'] = 0;
        userData['bcs'] = 0;
        userData['alg'] = [];
        userData['health'] = [];
        userData['petfood'] = [];

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SurveyScreen(
            userData: userData,
          );
        }));
      }
    } else if (selectedNum == 1) {
      print(nextFlag);
      if (nextFlag) {
        print(userData);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SurveyScreen(
            userData: userData,
          );
        }));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('회원 정보가 잘못되었습니다.'),
        ));
      }
    }
    return 'a';
  }
}
