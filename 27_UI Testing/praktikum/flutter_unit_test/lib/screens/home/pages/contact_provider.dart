import 'package:flutter/material.dart';
import '/models/contact_model.dart';
import '/services/service_provider.dart';

class ContactProvider extends ChangeNotifier {
  final ServiceProvider serviceProvider = ServiceProvider();

  List<ContactModel> _dataContact = [];
  List<ContactModel> get dataContact => _dataContact;

  Future getDataContact() async {
    _dataContact = await serviceProvider.fetchAllContact();
    notifyListeners();
  }
}
