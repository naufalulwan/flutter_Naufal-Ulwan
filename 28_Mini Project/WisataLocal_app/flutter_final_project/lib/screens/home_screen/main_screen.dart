import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './components/navigation_drawer.dart';
import 'pages/home_page/home_page.dart';
import 'pages/search_page/search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedNavbar = 0;

  @override
  void initState() {
    super.initState();
    setPreferenced();
  }

  void setPreferenced() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("toUse", true);
  }

  final _pageOptions = [
    HomePage(),
    SearchPage(),
  ];

  void _changeSelectedNavBar(int index) {
    setState(
      () {
        _selectedNavbar = index;
        _controller.animateToPage(index,
            curve: Curves.easeIn, duration: const Duration(milliseconds: 200));
      },
    );
  }

  final PageController _controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          _changeSelectedNavBar(index);
        },
        children: [
          _pageOptions[0],
          _pageOptions[1],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedNavbar,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _changeSelectedNavBar(index);
        },
      ),
    );
  }
}
