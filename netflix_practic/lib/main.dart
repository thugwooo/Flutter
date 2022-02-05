import 'package:flutter/material.dart';
import 'package:netflix_practic/routes.dart';
import 'package:netflix_practic/screens/splash/splash_screen.dart';
import 'package:netflix_practic/theme.dart';

void main() => runApp(Netflix());

class Netflix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: route,
      theme: theme(),
    );
  }
}
