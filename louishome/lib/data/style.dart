import 'package:flutter/material.dart';

var font = 'NanumBarunGothic';

var colors = [Color.fromRGBO(0, 36, 79, 1), Colors.grey];
var bold = [
  FontWeight.w700,
  FontWeight.w400,
];

var surveyBig = TextStyle(
  fontWeight: bold[0],
  fontSize: 25,
);
var line = BoxDecoration(
  border: Border.all(
    width: 4,
    color: colors[0],
  ),
  borderRadius: BorderRadius.circular(10),
);

AppBar mainAppBar = AppBar(
  backgroundColor: colors[0],
  title: whiteLogo,
  centerTitle: true,
);
AppBar basicAppBar = AppBar(
  backgroundColor: colors[0],
);
Image whiteLogo = Image.asset(
  'images/png/루이스홈 세로.png',
  width: 200,
);

Widget blueLogo(var width) {
  return Image.asset(
    'images/png/루이스홈 로고BLUE.png',
    width: width,
  );
}
