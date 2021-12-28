import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishomewebtest/data/controller.dart';
import 'package:louishomewebtest/data/style.dart';

class subscriptionScreen extends StatefulWidget {
  @override
  _subscriptionScreenState createState() => _subscriptionScreenState();
}

class _subscriptionScreenState extends State<subscriptionScreen> {
  final _formKey = GlobalKey<FormState>();
  userDataController userData = Get.put(userDataController());
  infoController infoData = Get.put(infoController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inputName(),
              inputPhonenumber(),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inputPetName(),
              inputPeriodWeek(),
            ],
          ),
          SizedBox(height: 20),
          inputAddress(),
          SizedBox(height: 20),
          selectPetfood(),
          SizedBox(height: 20),
          subscribeButton(),
        ],
      ),
    );
  }

  Widget inputName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('보호자 이름', style: infosmallStyle),
        Container(
          height: 30,
          width: Get.width * 0.2,
          child: TextFormField(
            onSaved: (value) => userData.userName.value = value.toString(),
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colors[0],
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget inputPhonenumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('휴대폰 번호', style: infosmallStyle),
        Container(
          height: 30,
          width: Get.width * 0.2,
          child: TextFormField(
            onSaved: (value) =>
                userData.userPhonenumber.value = value.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colors[0],
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget inputPetName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('반려동물 이름', style: infosmallStyle),
        Container(
          height: 30,
          width: Get.width * 0.2,
          child: TextFormField(
            onSaved: (value) => userData.petName.value = value.toString(),
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colors[0],
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget inputPeriodWeek() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('배송 기간(주)', style: infosmallStyle),
        Container(
          height: 30,
          width: Get.width * 0.2,
          child: TextFormField(
            onSaved: (value) => userData.periodWeek.value = value.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colors[0],
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget inputAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('주소 입력', style: infosmallStyle),
        Container(
          height: 30,
          width: Get.width * 0.5,
          child: TextFormField(
            onSaved: (value) => userData.address.value = value.toString(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colors[0],
                  width: 1,
                ),
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget selectPetfood() {
    return Row(
      children: [
        InkWell(
          child: Container(
            height: 40,
            width: 100,
            decoration: line,
            child: Center(
              child: Text(
                '사료 선택',
                style: infosmallStyle,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 100,
        ),
        Text(
          userData.petfood.value,
          style: infosmallStyle,
        ),
      ],
    );
  }

  Widget subscribeButton() {
    return Container(
      width: 100,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          _formKey.currentState!.save();
          print(userData.address.value);
          infoData.setUserList({
            'userName': userData.userName.value,
            'userPhonenumber': userData.userPhonenumber.value,
            'petName': userData.petName.value,
            'periodWeek': userData.periodWeek.value,
            'address': userData.address.value,
            'petfood': userData.petfood.value,
          });
          print(infoData.userList);
        },
        child: Text('구독하기'),
      ),
    );
  }
}
