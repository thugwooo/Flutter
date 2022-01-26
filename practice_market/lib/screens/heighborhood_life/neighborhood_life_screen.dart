import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_market/models/neighborhood_life.dart';
import 'package:practice_market/screens/components/appbar_preferred_size.dart';

import 'components/life_body.dart';
import 'components/life_header.dart';

class NeighborhoodLifeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('동네생활', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.search, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: Icon(CupertinoIcons.plus_rectangle_on_rectangle,
                  color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: Icon(CupertinoIcons.bell, color: Colors.black),
              onPressed: () {}),
        ],
        bottom: appBarBottomLine(),
      ),
      body: ListView(
        children: [
          LifeHeader(),
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: LifeBody(
              neighborhoodLife: neighborhoodLifeList[0],
            ),
          ),
        ],
      ),
    );
  }
}
