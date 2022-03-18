import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
            icon: Icons.group,
            text: 'New Group',
            onTap: () => print("Group"),
          ),
          _drawerItem(
            icon: Icons.lock,
            text: 'New Secret Chat',
            onTap: () => print('Secret Chat'),
          ),
          _drawerItem(
            icon: Icons.campaign_rounded,
            text: 'New Channel',
            onTap: () => print('Channel'),
          ),
          const Divider(
            height: 25,
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20.0,
            ),
          ),
          _drawerItem(
            icon: Icons.contacts_sharp,
            text: 'Contacts',
            onTap: () => print('Contacts'),
          ),
          _drawerItem(
            icon: Icons.person_add,
            text: 'Invite Friends',
            onTap: () => print("Invite Me"),
          ),
          _drawerItem(
            icon: Icons.settings,
            text: 'Settings',
            onTap: () => print("Settings"),
          ),
          _drawerItem(
            icon: Icons.live_help_outlined,
            text: 'TellMe FAQ',
            onTap: () => print("FAQ"),
          )
        ],
      ),
    );
  }
}

Widget _drawerItem({IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(
          icon,
          color: Color.fromARGB(990, 52, 73, 94),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(990, 52, 73, 94)),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}

Widget _drawerHeader() {
  return const UserAccountsDrawerHeader(
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage('assets/bg.gif'),
    )),
    currentAccountPicture: ClipOval(
      child: Image(image: AssetImage('assets/opang.png'), fit: BoxFit.cover),
    ),
    accountName: Text(
      'Naufal Ulwan',
      style: TextStyle(fontSize: 16),
    ),
    accountEmail: Text('+62 821 24293938'),
  );
}
