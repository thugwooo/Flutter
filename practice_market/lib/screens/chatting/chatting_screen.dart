import 'package:flutter/material.dart';
import 'package:practice_market/models/chat_message.dart';
import 'package:practice_market/screens/chatting/components/chat_container.dart';
import 'package:practice_market/screens/components/appbar_preferred_size.dart';

class ChattingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '채팅',
          style: TextStyle(color: Colors.black),
        ),
        bottom: appBarBottomLine(),
      ),
      body: ListView(
        children: List.generate(
          chatMessageList.length,
          (index) => ChatContainer(chatMessage: chatMessageList[index]),
        ),
      ),
    );
  }
}
