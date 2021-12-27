import 'package:flutter/material.dart';
import 'package:louishomeweb/data/style.dart';

Widget subscribeScreen(int selectedIndex) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 20,
      ),
      subButton(selectedIndex),
      SizedBox(
        height: 20,
      ),
      Divider(
        thickness: 2,
        color: colors[0],
      ),
      SizedBox(
        height: 20,
      ),
      subForm(),
    ],
  );
}

Widget subButton(int selectedIndex) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        child: Text(
          '구독하기',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      Container(
        child: Text(
          '구독정보',
          style: TextStyle(fontSize: 30),
        ),
      ),
    ],
  );
}

Widget subForm() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          inputName(),
          inputPhoneNumber(),
        ],
      ),
      SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          inputPetName(),
          inputDate(),
        ],
      ),
      SizedBox(height: 30),
      inputAddress(),
      SizedBox(height: 30),
      Row(
        children: [
          selectPetfood(),
          SizedBox(
            width: 145,
          ),
          petfoodImage(),
        ],
      ),
      SizedBox(height: 100),
      subscribeButton()
    ],
  );
}

Widget subscribeButton() {
  return Container(
    width: 150,
    height: 45,
    decoration: line,
    child: Center(
      child: Text(
        '구독하기',
        style: infosmallStyle,
      ),
    ),
  );
}

Widget inputName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '보호자 이름',
        style: infosmallStyle,
      ),
      Container(
        height: 30,
        width: 250,
        child: TextFormField(
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

Widget inputPhoneNumber() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '휴대폰 번호',
        style: infosmallStyle,
      ),
      Container(
        height: 30,
        width: 250,
        child: TextFormField(
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
      Text(
        '주소 입력',
        style: infosmallStyle,
      ),
      Container(
        height: 30,
        child: TextFormField(
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
      Text(
        '반려동물 이름',
        style: infosmallStyle,
      ),
      Container(
        height: 30,
        width: 250,
        child: TextFormField(
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

Widget inputDate() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '배송 기간(주)',
        style: infosmallStyle,
      ),
      Container(
        height: 30,
        width: 250,
        child: TextFormField(
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
  return Container(
    width: 100,
    height: 40,
    decoration: line,
    child: Center(
      child: Text(
        '사료 선택',
        style: infosmallStyle,
      ),
    ),
  );
}

Widget petfoodImage() {
  return Container(
    decoration: line,
    width: 150,
    height: 150,
    child: Center(child: Text('사료 사진')),
  );
}
