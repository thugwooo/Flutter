import 'package:flutter/material.dart';
import 'package:netflix_practic/screens/main_screens.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image(
              width: 100,
              height: 100,
              image: AssetImage('assets/images/dog.jpg'),
            ),
          ),
          SizedBox(height: 8),
          Text(
            '댕댕이',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, MainScreens.routeName);
      },
    );
  }
}
