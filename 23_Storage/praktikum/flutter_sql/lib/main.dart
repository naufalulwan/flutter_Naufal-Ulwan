import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sql/bloc/theme/theme_bloc.dart';

import '../screens/home_screen.dart';
import 'bloc/contact_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData dark = ThemeData.dark();
  final ThemeData light = ThemeData.light();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ContactBloc(),
          ),
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, bool>(
          builder: (context, state) => MaterialApp(
            title: 'Flutter SQlite',
            debugShowCheckedModeBanner: false,
            theme: state ? dark : light,
            home: HomeScreen(),
          ),
        ));
  }
}
