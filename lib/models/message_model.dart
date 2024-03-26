import 'package:chat_app/constants.dart';

class MessageModel {
  final String userMessage;
  final String id;
  MessageModel({required this.id, required this.userMessage});
  factory MessageModel.fromJson(json) {
    return MessageModel(userMessage: json[kMessage], id: json[kId]);
  }
}
