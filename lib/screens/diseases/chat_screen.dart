// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nhs/api/chat_bot_messages.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<ChatBotMessages> createChatBotMessages(String chat) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:5000/chat'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'messageText': chat,
    }),
  );
  print(response.body);
  final extractedData = json.decode(response.body) as Map<String, dynamic>;
  chatresponse = extractedData['answer'].toString();
  return ChatBotMessages.fromJson(jsonDecode(response.body));
}

class ChatScreen extends StatefulWidget {
  static String id = "chat_screen";

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Future<ChatBotMessages>? _futureChatBotMessages;

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  String? message;
  final _firestore = FirebaseFirestore.instance;

  final TextEditingController _diseasesChatController = TextEditingController();

  void messagesStream() async {
    await for (var snapshot in _firestore
        .collection("messages")
        .doc('widget.id1')
        .collection('message')
        .orderBy('time', descending: false)
        .snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[800],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/chatbot.png'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'NHT ChatBot',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            chatresponse,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: _firestore
                .collection("messages")
                .doc('widget.id1')
                .collection('message')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              final messages = snapshot.data!.docs.reversed;
              List<MessageBubble> messageWidgets = [];
              for (var message in messages) {
                final messageText = message['text'];
                final messageSender = message['sender'];
                final messageWidget = MessageBubble(
                  messageText: messageText,
                  messageSender: messageSender,
                  isMe: messageSender == "widget.id1",
                );
                messageWidgets.add(messageWidget);
              }

              return Expanded(
                child: ListView(
                  children: messageWidgets,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 20.0),
            child: Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF1976D2),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD8DDE9),
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                          hintText: 'Type here...'),
                      controller: _diseasesChatController,
                      onChanged: (value) {
                        message = value;
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _firestore
                          .collection("messages")
                          .doc('widget.id1')
                          .collection('message')
                          .add({
                        'text': message,
                        'sender': 'widget.id1',
                        'time': DateTime.now().millisecond,
                      });
                      messagesStream();
                      setState(() {
                        _futureChatBotMessages =
                            createChatBotMessages(_diseasesChatController.text);
                      });
                      _diseasesChatController.text = '';
                    },
                    icon: const Icon(
                      Ionicons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  FutureBuilder<ChatBotMessages> buildFutureBuilder() {
    return FutureBuilder<ChatBotMessages>(
      future: _futureChatBotMessages,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.answer);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String messageText;
  final String messageSender;
  final bool isMe;
  MessageBubble(
      {required this.messageText,
      required this.messageSender,
      required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            messageSender,
            style: const TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
          Material(
              color: isMe ? Colors.blue[700] : Colors.green[500],
              elevation: 5.0,
              borderRadius: isMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0))
                  : const BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                child: Text(
                  messageText,
                  style: const TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}

String chatresponse = '';
