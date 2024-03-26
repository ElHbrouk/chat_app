import 'package:chat_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomChatField extends StatefulWidget {
  const CustomChatField({
    super.key,
    required this.messages,
    required this.scrollContorller, required this.email,
  });
  final CollectionReference messages;
  final ScrollController scrollContorller;
  final String email;

  @override
  State<CustomChatField> createState() => _CustomChatFieldState();
}

class _CustomChatFieldState extends State<CustomChatField> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        onSubmitted: (data) {
          widget.messages.add({
            kMessage: data,
            kCreatedAt: DateTime.now(),
            kId: widget.email,
          });
          controller.clear();
          widget.scrollContorller
              .jumpTo(widget.scrollContorller.position.minScrollExtent);
        },
        style: TextStyle(
          color: Colors.grey[800],
        ),
        decoration: InputDecoration(
          hintText: 'Send Message',
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            color: kPrimaryColor,
            onPressed: () {},
            icon: const Icon(Icons.send),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
