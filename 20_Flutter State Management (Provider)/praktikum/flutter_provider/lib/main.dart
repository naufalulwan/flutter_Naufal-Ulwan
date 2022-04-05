import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Screens/home_page.dart';

import '../providers/contact_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContactProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi flutter provider',
        home: HomePage(),
      ),
    );
  }
}
