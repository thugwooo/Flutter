import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_practic/constants.dart';
import 'package:netflix_practic/screens/profile/components/add_card.dart';
import 'package:netflix_practic/screens/profile/components/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'MODU PLAY',
          style: kTitleTextStyle,
        ),
        actions: [
          Icon(
            FontAwesomeIcons.pen,
            size: 18,
          ),
          SizedBox(width: 12),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '모두의플레이를 시청할 프로필을 선택하세요',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Wrap(
                spacing: 25,
                children: [
                  ProfileCard(),
                  AddCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
