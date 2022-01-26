import 'package:flutter/material.dart';

import 'components/my_carrot_header.dart';

class MyCarrotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('정보', style: TextStyle(color: Colors.black)),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.5),
            child: Divider(
              thickness: 0.5,
              height: 0.5,
              color: Colors.grey,
            ),
          ),
        ),
        body: ListView(
          children: [
            MyCarrotHeader(),
            SizedBox(height: 8),
            //CardIconMenu(iconMenuList: iconMenu1),
            SizedBox(height: 8),
            //CardIconMenu(iconMenuList: iconMenu2),
            SizedBox(height: 8),
            //CardIconMenu(iconMenuList: iconMenu3),
          ],
        ),
      ),
    );
  }
}
