import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../constants/routes/route.dart';
import '../constants/routes/route_name.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Final Project Altera Academy",
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splashScreen,
      getPages: ScreenRoute.screens,
    );
  }
}
