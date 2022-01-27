import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_market/models/neighborhood_life.dart';
import 'package:practice_market/screens/components/image_container.dart';
import 'package:practice_market/theme.dart';

class LifeBody extends StatelessWidget {
  final NeighborhoodLife neighborhoodLife;

  LifeBody({Key? key, required this.neighborhoodLife}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Color(0xffd4d5dd),
          ),
        ),
      ),
      child: Column(
        children: [
          _buildTop(),
          _buildWriter(),
          _buildWriting(),
          _buildImage(),
          _buildTail(1),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey[300],
          )
        ],
      ),
    );
  }

  Widget _buildTop() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Color.fromRGBO(247, 247, 247, 1),
            ),
            child:
                Text(neighborhoodLife.category, style: textTheme().bodyText2),
          ),
          Text(neighborhoodLife.date, style: textTheme().bodyText2),
        ],
      ),
    );
  }

  Widget _buildWriter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ImageContainer(
            width: 30,
            height: 30,
            borderRadius: 15,
            imageUrl: neighborhoodLife.profileImgUri,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: ' ${neighborhoodLife.userName}',
                  style: textTheme().bodyText1,
                ),
                TextSpan(text: ' ${neighborhoodLife.location}'),
                TextSpan(text: ' 인증 ${neighborhoodLife.authCount}회'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWriting() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          neighborhoodLife.content,
          style: textTheme().bodyText1,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Visibility(
        visible: neighborhoodLife.contentImgUri != '',
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Image.network(
            neighborhoodLife.contentImgUri,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTail(int commentCount) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.smile,
            color: Colors.grey,
            size: 22,
          ),
          SizedBox(width: 8),
          Text(
            '공감하기',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(width: 22),
          Icon(FontAwesomeIcons.commentAlt, color: Colors.grey, size: 22),
          SizedBox(width: 8),
          Text(
            "${"댓글쓰기"} $commentCount",
            style: TextStyle(fontSize: 16, color: Colors.black),
          )
        ],
      ),
    );
  }
}
