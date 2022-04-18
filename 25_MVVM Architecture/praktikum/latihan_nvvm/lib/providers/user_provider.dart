import 'package:flutter/cupertino.dart';
import 'package:latihan_nvvm/models/user_model.dart';
import 'package:latihan_nvvm/services/service.dart';

class UserProvider extends ChangeNotifier {
  final ApiService service = ApiService();

  UserModel? users;

  Future fetchUserData() async {
    users = await service.fetchUsers();
    notifyListeners();
  }
}
