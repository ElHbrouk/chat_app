import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({
    super.key,
    required this.message,
  });
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 32, top: 16, bottom: 4),
        padding: const EdgeInsetsDirectional.all(32),
        decoration: BoxDecoration(
            color: Colors.lightBlue[800],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              bottomLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )),
        child: Text(
          style: const TextStyle(
            fontSize: 24,
          ),
          message.userMessage,
        ),
      ),
    );
  }
}
