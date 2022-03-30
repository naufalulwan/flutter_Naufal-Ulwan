import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data.dart';

class ListGridCard extends StatelessWidget {
  const ListGridCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final itemData = Provider.of<Data>(context);
    return ClipRRect(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/view', arguments: {'id': itemData.id});
        },
        child: Card(
          child: Image.file(
            itemData.cover,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
