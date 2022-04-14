import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_event.dart';

import '../models/contact_model.dart';

class ContactBloc extends Bloc<ContactEvent, List<Contact>> {
  ContactBloc() : super(<Contact>[]) {
    on<SetContact>(((event, emit) {
      emit(event.contactList);
    }));

    on<AddContact>(((event, emit) {
      List<Contact> newState = List.from(state);
      if (event.newContact != null) {
        newState.add(event.newContact);
      }

      emit(newState);
    }));

    on<DeleteContact>((event, emit) {
      List<Contact> newState = List.from(state);
      newState.removeAt(event.contactIndex);
      emit(newState);
    });
  }
}
