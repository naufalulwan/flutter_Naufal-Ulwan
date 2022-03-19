import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget with PreferredSizeWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      leading: Align(
        widthFactor: 1.0,
        alignment: Alignment.center,
        child: Text('Edit'),
      ),
      middle: Text(
        'Chats',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Align(
        widthFactor: 1.0,
        alignment: Alignment.center,
        child: Icon(
          Icons.ios_share,
          size: 25,
        ),
      ),
    );
  }
}
