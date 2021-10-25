import 'package:flutter/material.dart';

import 'package:louis_home_2/data/style.dart';

import 'package:louis_home_2/screens/survey_screen.dart';

class RegisterScreen extends StatefulWidget {
  var userData;
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  var pet = ["강아지", "고양이"];

  var selectedPetId = 0;
  var userData = {
    "name": "",
    "phoneNumber": "",
    "pet": "강아지",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 20),
            textFormName(),
            textFormPhoneNumber(),
            selectPet(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget textFormName() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          blueLogo,
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
        children: [
          blueLogo,
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

  Widget selectPet() {
    return Container(
      height: 100,
      width: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pet.length,
        itemBuilder: (context, index) => InkWell(
          child: Container(
            margin: EdgeInsets.all(10),
            width: 120,
            height: 60,
            decoration: louisBlueDeco(
              index,
              selectedPetId,
            ),
            child: Center(
              child: Text(
                pet[index],
                style: smallStyle,
              ),
            ),
          ),
          onTap: () {
            setState(() {
              selectedPetId = index;
              userData["pet"] = pet[selectedPetId];
            });
          },
        ),
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: Text('제출'),
      onPressed: () {
        _formKey.currentState!.save();
        userData['pet'] == '강아지'
            ? userData['breed'] = '그레이트 데인'
            : userData['breed'] = '데본렉스';
        print(userData);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SurveyScreen(
            userData: userData,
          );
        }));
      },
    );
  }
}