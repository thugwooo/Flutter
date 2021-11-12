import 'package:flutter/material.dart';
import 'package:louishome/data/data.dart';
import 'package:louishome/data/style.dart';
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
  @override
  void initState() {
    super.initState();
    userData = userInfo;
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
          userData['breed'] = selectedNum == 0 ? '그레이트 데인' : '데본렉스';
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SurveyScreen(
              userData: userData,
            );
          }));
        });
  }
}
