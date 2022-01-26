import 'package:flutter/material.dart';
import 'package:practice_market/models/icon_menu.dart';
import 'package:practice_market/theme.dart';

class CardIconMenu extends StatelessWidget {
  final List<IconMenu> iconMenuList;
  CardIconMenu({required this.iconMenuList});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            iconMenuList.length,
            (index) => _buildRowIconItems(
                iconMenuList[index].title, iconMenuList[index].iconData),
          ),
        ),
      ),
    );
  }

  Widget _buildRowIconItems(String title, IconData iconData) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Icon(iconData, size: 17),
          SizedBox(width: 20),
          Text(title, style: textTheme().subtitle1),
        ],
      ),
    );
  }
}
