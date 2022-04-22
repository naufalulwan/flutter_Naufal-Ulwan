import 'package:flutter/material.dart';
import 'package:flutter_unit_test/models/food_model.dart';
import '/services/service_provider.dart';

class FoodProvider extends ChangeNotifier {
  final ServiceProvider serviceProvider = ServiceProvider();

  List<FoodModel> _dataFood = [];
  List<FoodModel> get dataFood => _dataFood;

  Future getDataFood() async {
    _dataFood = await serviceProvider.fetchAllFood();
    notifyListeners();
  }
}
