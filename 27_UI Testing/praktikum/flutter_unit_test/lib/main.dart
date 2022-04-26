import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/home/pages/contact_provider.dart';
import '../screens/home/home_provider.dart';
import '../screens/home/home_screen.dart';
import '../screens/home/pages/food_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContactProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FoodProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter unit testing',
        home: HomeScreen(),
      ),
    );
  }
}
