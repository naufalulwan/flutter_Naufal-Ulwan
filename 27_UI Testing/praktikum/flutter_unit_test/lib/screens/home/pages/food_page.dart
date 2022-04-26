import 'package:flutter/material.dart';
import 'package:flutter_unit_test/screens/home/pages/food_provider.dart';
import 'package:provider/provider.dart';

import '../../detail/detail_screen.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodProvider>(builder: ((context, value, child) {
      return ListView.builder(
          itemCount: value.dataFood.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(value.dataFood[index].name!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) =>
                        DetailScreen(titleData: value.dataFood[index].name!)),
                  ),
                );
              },
            );
          });
    }));
  }
}
