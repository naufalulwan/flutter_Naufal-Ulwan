import 'package:flutter/cupertino.dart';
import '/models/contact_models.dart';

class ContactManager extends ChangeNotifier {
  final _contactModels = <ContactModel>[];
  List<ContactModel> get contactModels => List.from(_contactModels);

  void deleteContact(int index) {
    _contactModels.removeAt(index);
    notifyListeners();
  }

  void addContact(ContactModel contact) {
    _contactModels.add(contact);
    notifyListeners();
  }
}
