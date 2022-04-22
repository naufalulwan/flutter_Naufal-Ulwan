import 'package:flutter/material.dart';
import 'package:flutter_unit_test/screens/home/home_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.titleData, this.subTitleData})
      : super(key: key);

  String titleData;
  String? subTitleData;

  @override
  Widget build(BuildContext context) {
    int currentPage =
        Provider.of<HomeProvider>(context, listen: false).selectedNavbar;

    return Scaffold(
      appBar: AppBar(
        title: Text(currentPage == 0 ? 'Contact' : 'Food'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(titleData),
            Text(subTitleData ?? ''),
          ],
        ),
      ),
    );
  }
}
