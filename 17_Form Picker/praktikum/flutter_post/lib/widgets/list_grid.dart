import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';
import 'list_grid_card.dart';

class ListGrid extends StatelessWidget {
  const ListGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allData = Provider.of<DataItem>(context);
    final dataArea = allData.dataItem;
    return GridView.builder(
      itemCount: dataArea.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => ChangeNotifierProvider(
        create: (context) => dataArea[index],
        child: ListGridCard(),
      ),
    );
  }
}
