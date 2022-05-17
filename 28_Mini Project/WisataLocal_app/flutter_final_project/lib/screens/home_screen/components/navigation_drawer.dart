import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_final_project/constants/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../account_screen/account_controller.dart';
import '../../landing_screen/login_screen/login_controller.dart';

class NavigationDrawerWidget extends StatelessWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);

  final padding = const EdgeInsets.symmetric(horizontal: 20);

  void clearPreferenced() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  final AccountController _accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      _accountController.userData.value.name.toString();
    }

    generate() {
      return Obx(
        () => buildHeader(
          name: _accountController.userData.value.name.toString(),
          email: _accountController.userData.value.email.toString(),
        ),
      );
    }

    return Drawer(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            generate(),
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: padding,
                  child: Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: 12),
                        buildMenuItem(
                            text: 'Akun',
                            icon: Icons.people,
                            onClicked: () {
                              Get.toNamed(
                                RouteName.accountScreen,
                              );
                            }),
                        buildMenuItem(
                          text: 'Daftar Wacana',
                          icon: Icons.favorite_border,
                          onClicked: () => null,
                        ),
                        _accountController.userData.value.status == false
                            ? buildMenuItem(
                                text: 'Halaman Kontributor',
                                icon: Icons.workspaces_outline,
                                onClicked: () =>
                                    Get.toNamed(RouteName.contributorScreen),
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(height: 30),
                        const Divider(
                          color: Colors.black,
                          height: 0.5,
                          thickness: 1,
                        ),
                        const SizedBox(height: 30),
                        buildMenuItem(
                          text: 'Tentang Kami',
                          onClicked: () => Get.toNamed(RouteName.aboutScreen),
                        ),
                        buildMenuItem(
                          text: 'Keluar Akun',
                          icon: Icons.logout,
                          onClicked: () {
                            dialogExit();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 25),
                child: const Text(
                  'Sedate, Version 0.2e',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    String? image,
    required String? name,
    required String? email,
  }) =>
      Column(
        children: [
          Container(
            padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    border: _accountController.userData.value.status == false
                        ? Border.all(width: 2, color: Colors.yellowAccent)
                        : Border.all(width: 2, color: Colors.green),
                    // shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5),
                    ],
                  ),
                  child: _accountController.userData.value.url == ''
                      ? const CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.yellow,
                          backgroundImage:
                              AssetImage('assets/images/people.jpg'),
                        )
                      : CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.yellow,
                          backgroundImage: NetworkImage(
                              _accountController.userData.value.url.toString()),
                        ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email!,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 1, color: Colors.grey)
        ],
      );

  Widget buildMenuItem({
    required String text,
    IconData? icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.black;
    const hoverColor = Colors.black;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Future<void> dialogExit() {
    return Get.dialog(AlertDialog(
      title: const Text(
        'Ingin keluar dari akun ini?',
        style: TextStyle(fontSize: 17),
      ),
      actions: [
        MaterialButton(
          onPressed: (() => Get.back()),
          child: const Text('Tidak'),
        ),
        MaterialButton(
          onPressed: (() => Get.back(result: true)),
          child: const Text('Ya'),
        ),
      ],
    )).then((exit) async {
      if (exit == null) return;
      if (exit) {
        print('ya');
        await LoginController().signOut();
        clearPreferenced();
        Get.offAllNamed(RouteName.landingScreen);
      } else {
        print('tidak');
      }
    });
    ;
  }
}
