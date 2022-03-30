import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';
import '../screens/list_post_screen.dart';
import '../screens/add_post_screen.dart';
import '../screens/view_post_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataItem(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Post',
        routes: {
          '/': (ctx) => ListPostScreen(),
          '/view': (ctx) => ViewPostScreen(),
          '/add': (ctx) => AddPostScreen(),
        },
      ),
    );
  }
}
