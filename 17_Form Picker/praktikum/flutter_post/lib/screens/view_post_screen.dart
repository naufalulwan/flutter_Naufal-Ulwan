import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/data_provider.dart';

class ViewPostScreen extends StatelessWidget {
  const ViewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final id = route['id'];
    final data = Provider.of<DataItem>(context)
        .dataItem
        .firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('View Post'),
        backgroundColor: data.color,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Image.file(
              data.cover,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.date,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  data.caption,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
