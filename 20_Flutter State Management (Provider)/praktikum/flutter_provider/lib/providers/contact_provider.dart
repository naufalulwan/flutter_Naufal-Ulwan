import 'package:flutter/cupertino.dart';

import '../models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  final _contactModels = <Contact>[];
  List<Contact> get contactModels => List.from(_contactModels);

  void addContact(Contact models) {
    _contactModels.add(models);
    notifyListeners();
  }

  void deleteContact(int index) {
    _contactModels.removeAt(index);
    notifyListeners();
  }
}
