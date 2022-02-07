import 'package:flutter/material.dart';
import 'package:netflix_practic/screens/detail/detail_screen.dart';
import 'package:netflix_practic/screens/main_screens.dart';
import 'package:netflix_practic/screens/profile/profile_screen.dart';
import 'package:netflix_practic/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> route = {
  SplashScreen.routeName: (context) => SplashScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  MainScreens.routeName: (context) => MainScreens(),
  DetailScreen.routeName: (context) => DetailScreen(),
};
