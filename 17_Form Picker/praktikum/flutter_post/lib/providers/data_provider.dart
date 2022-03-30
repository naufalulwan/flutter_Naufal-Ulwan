import 'package:flutter/material.dart';
import 'data.dart';

class DataItem with ChangeNotifier {
  final _dataItem = <Data>[];
  List<Data> get dataItem => List.from(_dataItem);

  void addData(Data data) {
    _dataItem.add(data);
    notifyListeners();
  }
}
