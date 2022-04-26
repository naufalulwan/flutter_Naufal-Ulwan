import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test/screens/Add/add_screen.dart';
import 'package:flutter_unit_test/screens/detail/detail_screen.dart';
import 'package:flutter_unit_test/screens/home/home_provider.dart';
import 'package:flutter_unit_test/screens/home/home_screen.dart';
import 'package:flutter_unit_test/screens/home/pages/contact_provider.dart';
import 'package:flutter_unit_test/screens/home/pages/food_provider.dart';

import 'package:provider/provider.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = null;
  });

  group('Coba Test', () {
    testWidgets('Home Screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
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
          child: Builder(
            builder: (_) => MaterialApp(
              home: Consumer(
                builder: (BuildContext context, current, Widget? child) {
                  return const HomeScreen();
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.contact_page));
      await tester.pump();
      expect(find.text('Contacts'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.fastfood));
      await tester.pump();
      expect(find.text('Foods'), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });

    testWidgets('Detail Screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
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
          child: Builder(
            builder: (_) => MaterialApp(
              home: Consumer(
                builder: (BuildContext context, current, Widget? child) {
                  return DetailScreen(
                    titleData: 'null',
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('Contact'), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
    testWidgets('Detail Screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
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
          child: Builder(
            builder: (_) => MaterialApp(
              home: Consumer(
                builder: (BuildContext context, current, Widget? child) {
                  return AddScreen();
                },
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}
