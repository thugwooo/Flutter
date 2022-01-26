import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_market/theme.dart';

class MyCarrotHeader extends StatelessWidget {
  const MyCarrotHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            _buildProfileRow(),
            SizedBox(height: 30),
            _buildProfileButton(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRoundTextButton('판매내역', FontAwesomeIcons.receipt),
                _buildRoundTextButton('구매내역', FontAwesomeIcons.shoppingBag),
                _buildRoundTextButton('관심목록', FontAwesomeIcons.heart),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow() {
    return Row(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 65,
              height: 65,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.5),
                child: Image.network(
                  'https://placeimg.com/200/100/people',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[100],
                ),
                child: Icon(Icons.camera_alt_outlined, size: 15),
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('developer', style: textTheme().headline2),
            SizedBox(height: 10),
            Text('하이루'),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFD4D5DD),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            '프로필 보기',
            style: textTheme().subtitle1,
          ),
        ),
      ),
    );
  }

  Widget _buildRoundTextButton(String title, IconData iconData) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 226, 203, 1),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Color(0xFFD4D5DD), width: 0.5)),
          child: Icon(iconData, color: Colors.orange),
        ),
        SizedBox(height: 10),
        Text(title, style: textTheme().subtitle1),
      ],
    );
  }
}
