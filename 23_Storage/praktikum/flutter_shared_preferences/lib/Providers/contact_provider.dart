import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/contact_model.dart';

class ContactProvider with ChangeNotifier {
  List<Contact> contacts = [];

  ContactProvider() {
    initialState();
  }

  UnmodifiableListView<Contact> get allContact =>
      UnmodifiableListView(contacts);

  void initialState() {
    syncData();
  }

  void addContact(Contact _contact) {
    contacts.add(_contact);

    updateSharedPrefrences();

    notifyListeners();
  }

  void deleteContact(Contact _contact) {
    contacts
        .removeWhere((contact) => contact.numberPhone == _contact.numberPhone);

    updateSharedPrefrences();
    notifyListeners();
  }

  Future updateSharedPrefrences() async {
    List<String> setContact =
        contacts.map((value) => json.encode(value.toJson())).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('contacts', setContact);
  }

  Future syncData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getStringList('contacts');

    if (result != null) {
      contacts = result.map((c) => Contact.fromJson(json.decode(c))).toList();
    }

    notifyListeners();
  }
}
