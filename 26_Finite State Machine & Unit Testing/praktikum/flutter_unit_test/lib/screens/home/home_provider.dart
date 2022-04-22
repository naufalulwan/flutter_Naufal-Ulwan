import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  late int selectedNavbar = 0;

  onChangeNavbar(int index) {
    selectedNavbar = index;
    notifyListeners();
  }
}
