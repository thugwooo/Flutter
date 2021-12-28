import 'package:flutter/material.dart';

var font = 'NanumBarunGothic';
var colors = [Color.fromRGBO(0, 36, 79, 1), Colors.grey];
var line = BoxDecoration(
  border: Border.all(
    width: 2,
    color: colors[0],
  ),
  borderRadius: BorderRadius.circular(2),
);

var infoStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);
var infosmallStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
