import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/constants/routes/route_name.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool checkConnect = false;
  bool alreadyToUse = false;

  @override
  void initState() {
    super.initState();

    InternetConnectionChecker().onStatusChange.listen((status) {
      final isDeviceConnected = status == InternetConnectionStatus.connected;
      setState(() => checkConnect = isDeviceConnected);
      startSplashScreen();
      getPreferenced();
    });
  }

  User? user = FirebaseAuth.instance.currentUser;

  void getPreferenced() async {
    final prefs = await SharedPreferences.getInstance();
    alreadyToUse = prefs.getBool("toUse") ?? false;
    log(alreadyToUse.toString());
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    if (checkConnect) {
      Timer(duration, () {
        alreadyToUse && user!.uid != null
            ? Get.offNamed(RouteName.mainScreen)
            : Get.offNamed(RouteName.landingScreen);
      });
    } else {
      Timer(duration, () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Tidak dapat terhubung ke Internet',
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/mountain3D.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Wisata',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.yellow,
                      ),
                    ),
                    Text(
                      'Local',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            LoadingAnimationWidget.waveDots(color: Colors.green, size: 25)
          ],
        ),
      ),
    );
  }
}
