import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/food_model.dart';
import '../models/contact_model.dart';

class ServiceProvider {
  final String _baseUrl =
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice';
  final _dio = Dio();

  Future<List<ContactModel>> fetchAllContact() async {
    try {
      Response response = await _dio.get(_baseUrl + '/contacts');
      if (response.statusCode == 200) {
        Iterable list = response.data;
        return list.map((e) => ContactModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<List<FoodModel>> fetchAllFood() async {
    try {
      Response response = await _dio.get(_baseUrl + '/foods');

      if (response.statusCode == 200) {
        Iterable list = response.data;
        return list.map((e) => FoodModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
