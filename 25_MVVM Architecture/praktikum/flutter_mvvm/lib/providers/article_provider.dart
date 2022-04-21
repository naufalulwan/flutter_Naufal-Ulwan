import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/services/api_service.dart';

import '../models/article_model.dart';

class ArticleProvider extends ChangeNotifier {
  final ApiService service = ApiService();
  List<ArticleModel> model = [];

  Future getContactData() async {
    model = (await service.getData())!;
    notifyListeners();
  }
}
