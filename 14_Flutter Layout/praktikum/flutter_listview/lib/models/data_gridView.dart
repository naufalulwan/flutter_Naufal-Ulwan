import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Item {
  final int id;
  final IconData icon;

  Item({
    required this.id,
    required this.icon,
  });
}

List<Item> items = [
  Item(
    id: 0,
    icon: Icons.add,
  ),
  Item(
    id: 1,
    icon: Icons.access_alarm,
  ),
  Item(
    id: 2,
    icon: Icons.ac_unit,
  ),
  Item(
    id: 3,
    icon: Icons.account_balance_wallet,
  ),
  Item(
    id: 4,
    icon: Icons.data_saver_on,
  ),
  Item(
    id: 5,
    icon: Icons.looks_outlined,
  ),
  Item(
    id: 6,
    icon: Icons.swap_vertical_circle_sharp,
  ),
  Item(
    id: 7,
    icon: Icons.wifi,
  ),
];
