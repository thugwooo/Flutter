import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(disabledBorder: _buildOutLineInputBorder()),
      ),
    );
  }

  OutlineInputBorder _buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 0.5,
        color: Color(0xFFD4D5DD),
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
