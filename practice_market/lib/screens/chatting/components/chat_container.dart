import 'package:flutter/material.dart';
import 'package:practice_market/models/chat_message.dart';
import 'package:practice_market/screens/components/image_container.dart';
import 'package:practice_market/theme.dart';

class ChatContainer extends StatelessWidget {
  ChatContainer({
    Key? key,
    required this.chatMessage,
  });

  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            ImageContainer(
              width: 50,
              height: 50,
              borderRadius: 25,
              imageUrl: chatMessage.profileImage,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: chatMessage.sender,
                          style: textTheme().bodyText1,
                        ),
                        TextSpan(text: chatMessage.location),
                        TextSpan(text: ' * ${chatMessage.sendDate}'),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    chatMessage.message,
                    style: textTheme().bodyText1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: chatMessage.imageUri != null,
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ImageContainer(
                    width: 50,
                    height: 50,
                    borderRadius: 8,
                    imageUrl: chatMessage.imageUri ?? '',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
