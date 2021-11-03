import 'package:flutter/material.dart';

TextStyle smallStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w700,
  fontFamily: 'NanumBarunGothic',
);
AppBar mainAppBar = AppBar(
  backgroundColor: colors[0],
  title: whiteLogo,
);
Image whiteLogo = Image.asset(
  'images/png/루이스홈 세로.png',
  width: 200,
);
Image blueLogo = Image.asset(
  'images/png/BLUE_CIRCLE.png',
  width: 20,
);
var colors = [Color.fromRGBO(0, 36, 79, 1), Colors.grey];
dynamic louisBlueDeco(var index, var selectedItem) {
  return BoxDecoration(
    border: Border.all(
      width: 2,
      color: index == selectedItem ? colors[0] : colors[1],
    ),
    borderRadius: BorderRadius.circular(20),
  );
}
