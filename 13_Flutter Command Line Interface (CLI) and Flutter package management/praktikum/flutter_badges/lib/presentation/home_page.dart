import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Badge's Package"),
        actions: [
          Icon(Icons.search),
          Padding(padding: EdgeInsets.only(left: 10))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            DefaultTabController(
              length: 3,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.expand(height: 50),
                    child: TabBar(
                      labelColor: Colors.black,
                      tabs: [
                        Tab(
                          child: Container(
                            child: Badge(
                              shape: BadgeShape.circle,
                              position:
                                  BadgePosition.topEnd(top: -15, end: -20),
                              badgeContent: Text('3',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              child: Text('Hello'),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Badge(
                              position: BadgePosition.topEnd(top: -9, end: -16),
                              child: Text('Hello'),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            child: Badge(
                              position:
                                  BadgePosition.topEnd(top: -15, end: -20),
                              badgeContent: Text('2',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              child: Text('Hello'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Chip(
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.deepPurple,
                    label: Text('BADGE', style: TextStyle(color: Colors.white)),
                  ),
                  Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    badgeColor: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8),
                    badgeContent:
                        Text('BADGE', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
