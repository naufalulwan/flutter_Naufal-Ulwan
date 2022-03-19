import 'package:flutter_cupertino/model/user.dart';

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
    text: 'gas warkop ga?',
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
    senderGroup: sedate,
    time: '8:45 AM',
    sender: 'Rojali',
    text: 'besok jadi ?',
    unread: true,
  ),
];
