import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data.dart';
import '../providers/data_provider.dart';
import '../widgets/add_form.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataItem>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: AddForm(
        onCreate: (dataItem) {
          data.addData(dataItem);
          Navigator.pop(context);
        },
      ),
    );
  }
}
