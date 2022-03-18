import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

final User currentUser = User(
  id: 0,
  name: 'Opang',
  imageUrl: 'assets/kabedon.png',
  isOnline: true,
);

final User Jali = User(
  id: 1,
  name: 'Jali',
  imageUrl: 'assets/jamet.jpeg',
  isOnline: true,
);

class UserGroup {
  final int id;
  final IconData icon;
  final String name;
  final String imageUrl;
  final bool isOnline;

  UserGroup({
    required this.id,
    required this.icon,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

final UserGroup pp = UserGroup(
  id: 0,
  icon: Icons.group,
  name: 'Persatuan PP',
  imageUrl: 'assets/pp.jpg',
  isOnline: true,
);
