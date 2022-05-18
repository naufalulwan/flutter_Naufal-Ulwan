import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_final_project/models/api_model.dart';

class ApiService {
  final String _url = 'https://crack-duck-83.hasura.app/api/rest/tour';

  late Dio _dio;

  ApiService() {
    _dio = Dio();
  }
  Future<List<TourPlace>?> getApi() async {
    try {
      var response = await _dio.get(_url);
      if (response.statusCode == 200) {
        var _model = ApiModel.fromJson(response.data);

        var listData = _model.tourPlace;
        return listData;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
