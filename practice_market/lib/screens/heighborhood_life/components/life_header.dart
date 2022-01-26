import 'package:flutter/material.dart';
import 'package:practice_market/models/neighborhood_life.dart';
import 'package:practice_market/screens/components/image_container.dart';
import 'package:practice_market/theme.dart';

class LifeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            ImageContainer(
              width: 45,
              height: 45,
              borderRadius: 6,
              imageUrl: 'https://placeimg.com/200/100/any',
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                lifeTitle,
                style: textTheme().bodyText1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
