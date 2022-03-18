import 'package:flutter/material.dart';
import 'package:flutter_widget/model/user.dart';
import 'package:flutter_widget/model/message.dart';
import 'package:badges/badges.dart';

class ChatPages extends StatelessWidget {
  const ChatPages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        final Message chat = chats[index];
        return GestureDetector(
          onTap: () => null,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: chat.unread
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                          // shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5),
                          ],
                        )
                      : BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5),
                          ],
                        ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(chat.sender.imageUrl),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.69,
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                chat.sender.name,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              chat.sender.isOnline
                                  ? Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : Container(
                                      child: null,
                                    )
                            ],
                          ),
                          Text(
                            chat.time,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          chat.text,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class GroupPages extends StatelessWidget {
  const GroupPages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatsGroup.length,
      itemBuilder: (BuildContext context, int index) {
        final MessageGroup chat = chatsGroup[index];
        return GestureDetector(
          onTap: () => null,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: chat.unread
                      ? BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                          // shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5),
                          ],
                        )
                      : BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5),
                          ],
                        ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(chat.senderGroup.imageUrl),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.69,
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(chat.senderGroup.icon),
                              const Padding(
                                padding: EdgeInsets.only(right: 5),
                              ),
                              Text(
                                chat.senderGroup.name,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              chat.senderGroup.isOnline
                                  ? Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Badge(
                                        badgeColor: Colors.green,
                                        shape: BadgeShape.circle,
                                        badgeContent: const Text(
                                          "8",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  //     margin: const EdgeInsets.only(left: 5),
                                  //     width: 7,
                                  //     height: 7,
                                  //     decoration: BoxDecoration(
                                  //       shape: BoxShape.circle,
                                  //       color: Theme.of(context).primaryColor,
                                  //     ),
                                  //   )
                                  : Container(
                                      child: null,
                                    )
                            ],
                          ),
                          Text(
                            chat.time,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            chat.sender + ' : ',
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            padding: const EdgeInsets.only(
                              left: 0,
                            ),
                            alignment: Alignment.topLeft,
                            child: Text(
                              chat.text,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class StatusPages extends StatelessWidget {
  const StatusPages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        alignment: Alignment.center,
        color: Colors.orange,
        child: Text('Status Page'),
      ),
    );
  }
}

class CallPages extends StatelessWidget {
  const CallPages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        alignment: Alignment.center,
        color: Colors.green[200],
        child: Text('Call Page'),
      ),
    );
  }
}
