// To parse this JSON data, do
//
//     final chatBotMessages = chatBotMessagesFromJson(jsonString);

import 'dart:convert';

ChatBotMessages chatBotMessagesFromJson(String str) =>
    ChatBotMessages.fromJson(json.decode(str));

String chatBotMessagesToJson(ChatBotMessages data) =>
    json.encode(data.toJson());

class ChatBotMessages {
  ChatBotMessages({
    required this.answer,
  });

  String answer;

  factory ChatBotMessages.fromJson(Map<String, dynamic> json) =>
      ChatBotMessages(
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
      };
}
