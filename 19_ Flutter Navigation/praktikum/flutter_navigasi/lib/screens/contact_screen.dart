import 'dart:developer';
import 'package:flutter/material.dart';
import './create_contact_screen.dart';
import './tabs/with_named.dart';
import './tabs/without_named.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);
  static const nameRoute = '/Contact';

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentPosition = 0;

  final _pages = [
    WithNamed(),
    WithoutNamed(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.14),
        child: AppBar(
          centerTitle: true,
          title: const Text('Contacts'),
          bottom: myTab(),
        ),
      ),
      body: _pages[_currentPosition],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _currentPosition == 0
              ? Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => CreateContactScreen()))
              : Navigator.of(context).pushNamed(CreateContactScreen.nameRoute);
        },
        child: _currentPosition == 0
            ? const Icon(Icons.route)
            : const Icon(Icons.router_outlined),
      ),
    );
  }

  myTab() {
    return TabBar(
      controller: _tabController,
      tabs: const [
        Tab(
          text: "With Named",
        ),
        Tab(
          text: "Without Named",
        )
      ],
      onTap: (index) {
        setState(() {
          _currentPosition = index;
        });
      },
    );
  }
}
