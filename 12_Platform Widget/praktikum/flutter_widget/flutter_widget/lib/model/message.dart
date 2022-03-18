import 'package:flutter/cupertino.dart';
import 'package:flutter_widget/model/user.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.unread,
  });
}

List<Message> chats = [
  Message(
    sender: currentUser,
    time: '8:45 PM',
    text: 'Woi bagi linknya yang kemaren anjay, manaaa',
    unread: true,
  ),
  Message(
    sender: Jali,
    time: 'Tue',
    text: 'kuy',
    unread: true,
  ),
];

class MessageGroup {
  final UserGroup senderGroup;
  final String time;
  final String sender;
  final String text;
  final bool unread;

  MessageGroup({
    required this.senderGroup,
    required this.time,
    required this.sender,
    required this.text,
    required this.unread,
  });
}

List<MessageGroup> chatsGroup = [
  MessageGroup(
    senderGroup: pp,
    time: '8:45 PM',
    sender: 'udin',
    text: 'Kita gerakin lah ayok, sapa tau kan dapet nasi bungkus',
    unread: true,
  ),
];
