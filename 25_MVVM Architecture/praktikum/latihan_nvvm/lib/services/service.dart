import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:latihan_nvvm/models/user_detail_model.dart';

import '../models/user_model.dart';

class ApiService {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://reqres.in/api/';

  Future<UserModel> fetchUsers() async {
    try {
      final response = await _dio.get(_baseUrl + 'users');
      return UserModel.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<UserDetailModel> fetchUserDetail({required String id}) async {
    try {
      final response = await _dio.get(_baseUrl + 'users/$id');
      return UserDetailModel.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
