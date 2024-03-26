import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
  });
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 32, top: 16, bottom: 4),
        padding: const EdgeInsetsDirectional.all(32),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
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
