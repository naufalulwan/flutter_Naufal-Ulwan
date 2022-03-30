import 'package:flutter/material.dart';
import '../widgets/list_grid.dart';

class ListPostScreen extends StatelessWidget {
  const ListPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Post'),
      ),
      body: ListGrid(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
