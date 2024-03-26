import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_bubble_for_friend.dart';
import 'package:chat_app/widgets/custom_chat_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChattingView extends StatefulWidget {
  const ChattingView({super.key});

  @override
  State<ChattingView> createState() => _ChattingViewState();
}

class _ChattingViewState extends State<ChattingView> {
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);
  final contorller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 65,
            ),
            const Text('chat'),
          ],
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<MessageModel> messagesList = [];
                  for (var message in snapshot.data!.docs) {
                    messagesList.add(MessageModel.fromJson(message));
                  }
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          physics: const ClampingScrollPhysics(),
                          controller: contorller,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) =>
                              messagesList[index].id == email
                                  ? ChatBubble(
                                      message: messagesList[index],
                                    )
                                  : ChatBubbleForFriend(message: messagesList[index]),
                        ),
                      ),
                     
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      "There's an error!",
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                  );
                } else {
                  return const Text(
                    'Loading...',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  );
                }
              },
            ),
          ),
           CustomChatField(
                  messages: messages,
                  scrollContorller: contorller,
                  email: email.toString(),
                ),
        ],
      ),
    );
  }
}
