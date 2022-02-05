import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            child: Icon(
              Icons.add_circle,
              color: Colors.white,
              size: 50,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '프로필 추가',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
