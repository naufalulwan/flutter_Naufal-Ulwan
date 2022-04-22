import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/contact_page.dart';
import './pages/food_page.dart';
import 'home_provider.dart';
import 'pages/contact_provider.dart';
import 'pages/food_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, current, _) {
      Future.delayed(Duration.zero, () {
        final _providerContact =
            Provider.of<ContactProvider>(context, listen: false);
        _providerContact.getDataContact();
        final _providerFood = Provider.of<FoodProvider>(context, listen: false);
        _providerFood.getDataFood();
      });
      Widget _getWidget() {
        if (current.selectedNavbar != 0) {
          return const FoodPage();
        } else {
          return const ContactPage();
        }
      }

      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: current.selectedNavbar == 0
              ? const Text('Contact')
              : const Text('Food'),
        ),
        body: _getWidget(),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              label: 'Contact',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: 'Food',
            ),
          ],
          currentIndex: current.selectedNavbar,
          unselectedItemColor: Colors.grey,
          onTap: Provider.of<HomeProvider>(context).onChangeNavbar,
        ),
      );
    });
  }
}
