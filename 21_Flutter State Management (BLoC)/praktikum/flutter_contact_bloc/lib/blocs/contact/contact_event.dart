part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent {}

class OnAddContact extends ContactEvent {
  final Contact contact;
  OnAddContact(this.contact);

  List<Object> get props => [contact];
}

class OnDeletedContact extends ContactEvent {
  final Contact contact;
  OnDeletedContact({required this.contact});

  List<Object> get props => [contact];
}

class OnFetchContact extends ContactEvent {}
