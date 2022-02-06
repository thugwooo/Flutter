import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayButton extends StatelessWidget {
  final double? width;
  const PlayButton({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.play,
            color: Colors.black,
            size: 16,
          ),
          SizedBox(width: 5),
          Text(
            '재생',
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
