import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/article_model.dart';

class ApiService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  final Dio _dio = Dio();

  Future<List<ArticleModel>?> getData() async {
    try {
      Response response = await _dio.get(_baseUrl);

      if (response.statusCode == 200) {
        log(response.data.toString());
        List data = response.data;
        return data.map((e) => ArticleModel.fromJson(e)).toList();
      }
      return null;
    } on DioError catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
