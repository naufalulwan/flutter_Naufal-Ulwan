import 'package:flutter/material.dart';
import '../screens/pages/account_page.dart';
import '../screens/pages/listView_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/themes/theme_bloc.dart';
import 'add_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavbar = 0;

  Widget _getWidget() {
    if (_selectedNavbar == 1) {
      return Accoount();
    }
    return Contact();
  }

  void _changeSelectedNavBar(int index) {
    setState(
      () {
        _selectedNavbar = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contact'),
        leading: IconButton(
          onPressed: () => context.read<ThemeBloc>().changeTheme(),
          icon: Icon(Icons.invert_colors),
          splashRadius: 25,
          tooltip: 'Change Color',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                return const AddPage();
              }, transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                final tween = Tween(begin: 0.0, end: 1.0);
                return FadeTransition(
                  opacity: animation.drive(tween),
                  child: child,
                );
              }));
            },
            icon: const Icon(Icons.add),
            splashRadius: 25,
            tooltip: 'Add Contact',
          ),
        ],
      ),
      body: _getWidget(),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  Widget bottomNavigation() {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Contact',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        )
      ],
      currentIndex: _selectedNavbar,
      unselectedItemColor: Colors.grey,
      onTap: _changeSelectedNavBar,
    );
  }
}
