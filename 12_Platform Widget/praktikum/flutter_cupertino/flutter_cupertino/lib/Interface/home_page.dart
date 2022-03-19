import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino/Model/user.dart';
import 'package:flutter_cupertino/Model/message.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<int, Widget> tab = const <int, Widget>{
    0: Text('All Chats'),
    1: Text('Work'),
    2: Text('Unread'),
    3: Text('Personal'),
  };
  @override
  Widget build(BuildContext context) {
    List<Widget> _tabs = [];
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle_fill),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone_fill),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2_fill),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings_solid),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: Align(
                widthFactor: 1.0,
                alignment: Alignment.center,
                child: CupertinoButton(
                  child: Text('Edit'),
                  onPressed: () => null,
                  padding: EdgeInsets.zero,
                ),
              ),
              middle: Text(
                'Chats',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: CupertinoButton(
                child: Icon(Icons.ios_share_rounded),
                onPressed: () => null,
                padding: EdgeInsets.zero,
              ),
            ),
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    CupertinoSearchTextField(),
                    Container(
                      width: double.infinity,
                      child: CupertinoSlidingSegmentedControl(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.0, vertical: 10.0),
                        backgroundColor: Colors.white,
                        children: tab,
                        onValueChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: chats.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Message chat = chats[index];
                          return GestureDetector(
                            onTap: () => null,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage(chat.sender.imageUrl),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.78,
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                      bottom: 22,
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Text(
                                                  chat.sender.name,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 5),
                                                  width: 7,
                                                  height: 7,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
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
                                          height: 5,
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
