import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_market/models/recommend_store.dart';
import 'package:practice_market/screens/components/appbar_preferred_size.dart';
import 'package:practice_market/screens/near_me/components/bottom_title_icon.dart';
import 'package:practice_market/screens/near_me/components/round_border_text.dart';
import 'package:practice_market/screens/near_me/components/search_text_field.dart';
import 'package:practice_market/screens/near_me/components/store_item.dart';
import 'package:practice_market/theme.dart';

class NearMeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 근처', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.pencil, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.bell, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: appBarBottomLine(),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SearchTextField(),
          ),
          SizedBox(
            height: 66,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: searchKeyword.length,
              itemBuilder: (context, index) {
                return Center(
                  child: RoundBorderText(
                    title: searchKeyword[index],
                    position: index,
                  ),
                );
              },
            ),
          ),
          Divider(color: Colors.grey[100], thickness: 10),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 30),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 22,
              runSpacing: 30,
              children: [
                BottomTitleIcon(title: '구인구직', iconData: FontAwesomeIcons.user),
                BottomTitleIcon(
                    title: '과외/클래스', iconData: FontAwesomeIcons.edit),
                BottomTitleIcon(
                    title: '농수산물', iconData: FontAwesomeIcons.appleAlt),
                BottomTitleIcon(title: '부동산', iconData: FontAwesomeIcons.hotel),
                BottomTitleIcon(title: '중고차', iconData: FontAwesomeIcons.car),
                BottomTitleIcon(
                    title: '전시/행사', iconData: FontAwesomeIcons.chessBishop),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text('이웃들의 추천 가게', style: textTheme().headline2),
          ),
          SizedBox(height: 20),
          Container(
            height: 288,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recommendStoreList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: StoreItem(recommendStore: recommendStoreList[index]),
                );
              },
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
