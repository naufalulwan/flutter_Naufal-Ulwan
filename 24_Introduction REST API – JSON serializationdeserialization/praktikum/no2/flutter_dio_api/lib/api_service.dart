import 'package:dio/dio.dart';
import 'package:flutter_dio_api/model.dart';

class ApiService {
  final String _url =
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/';

  late Dio _dio;

  ApiService() {
    _dio = Dio();
  }

  Future getData() async {
    Response response = await _dio.get(_url);
    if (response.statusCode == 200) {
      Iterable it = response.data;
      List<Contact> contact = it.map((e) => Contact.fromJson(e)).toList();
      return contact;
    }
  }
}
