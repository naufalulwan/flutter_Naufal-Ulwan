import '../models/contact_model.dart';

abstract class ContactEvent {}

class AddContact extends ContactEvent {
  late Contact newContact;

  AddContact(Contact contacts) {
    newContact = contacts;
  }
}

class DeleteContact extends ContactEvent {
  late int contactIndex;

  DeleteContact(int index) {
    contactIndex = index;
  }
}

class SetContact extends ContactEvent {
  late List<Contact> contactList;

  SetContact(List<Contact> contacts) {
    contactList = contacts;
  }
}
