import 'package:flutter/material.dart';

TextStyle smallStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);
AppBar mainAppBar = AppBar(
  backgroundColor: colors[0],
  leading: whiteLogo,
  title: Text('LouisHome'),
);
Image whiteLogo = Image.asset(
  'images/png/LOGO-WHITE.png',
);
Image blueLogo = Image.asset(
  'images/png/LOGO-BLUE.png',
  width: 40,
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
