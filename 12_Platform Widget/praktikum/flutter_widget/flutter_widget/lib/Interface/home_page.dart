import 'package:flutter/material.dart';
import 'package:flutter_widget/Interface/drawer_widget.dart';
import 'package:flutter_widget/Interface/pages.dart';
import 'package:flutter/src/widgets/visibility.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavbar = 0;
  var _isVisible;

  void _changeSelectedNavBar(int index) {
    setState(
      () {
        _selectedNavbar = index;
      },
    );
  }

  @override
  initState() {
    super.initState();
    _isVisible = true;
  }

  Widget _getWidget() {
    if (_selectedNavbar == 1) {
      setState(() {
        _isVisible = true;
      });
      return GroupPages();
    } else if (_selectedNavbar == 2) {
      setState(() {
        _isVisible = false;
      });
      return StatusPages();
    } else if (_selectedNavbar == 3) {
      setState(() {
        _isVisible = false;
      });
      return CallPages();
    }
    _isVisible = true;
    return ChatPages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TellMe"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              padding: EdgeInsets.only(right: 10),
              onPressed: () {})
        ],
      ),
      drawer: DrawerWidget(),
      body: _getWidget(),
      floatingActionButton: Visibility(
        visible: _isVisible,
        child: FloatingActionButton(
          onPressed: null,
          tooltip: 'Start Chat',
          child: Icon(Icons.edit),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Group',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web_stories),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Call',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
