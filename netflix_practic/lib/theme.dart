import 'package:flutter/material.dart';
import 'package:netflix_practic/constants.dart';

ThemeData theme() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(color: Colors.black),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: kTextColor,
      ),
    ),
  );
}
