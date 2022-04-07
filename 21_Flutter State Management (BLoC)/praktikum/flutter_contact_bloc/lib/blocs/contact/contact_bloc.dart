import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '/models/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    List<Contact> listContact = [];

    on<OnAddContact>((event, emit) {
      listContact.add(event.contact);
      emit(ContactLoaded(listContact));
    });

    on<OnDeletedContact>((event, emit) {
      final state = this.state;
      if (state is ContactLoaded) {
        listContact.remove(event.contact);
        emit(ContactLoaded(listContact));
      }
    });

    on<OnFetchContact>((event, emit) async {
      emit(ContactLoading());
      emit(ContactLoaded(listContact));
    });
  }
}
