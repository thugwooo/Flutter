import 'package:flutter/material.dart';
import 'package:netflix_practic/constants.dart';
import 'package:netflix_practic/models/nav_item.dart';
import 'package:netflix_practic/screens/coming/coming_screen.dart';
import 'package:netflix_practic/screens/contents_list/content_list_screen.dart';
import 'package:netflix_practic/screens/home/home_screen.dart';

class MainScreens extends StatefulWidget {
  static String routeName = '/main_screens';

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;
  List pages = [
    HomeScreen(),
    ComingScreen(),
    ContentListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: kDarkColor,
        selectedFontSize: 12,
        items: List.generate(
          navItem.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(
              navItem[index].icon,
            ),
            label: navItem[index].label,
          ),
        ),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
