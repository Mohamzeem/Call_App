// ignore_for_file: unused_local_variable
import 'package:call/Features/Contacts/data/repo/contacts_repo_impl.dart';
import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactsRepoImpl repo;

  ContactsBloc({required this.repo}) : super(ContactsInitial()) {
    List<UserModel> listOfContacts = [];
    on<ContactsEvent>((event, emit) async {
      if (event is GetContactsEvent) {
        emit(const ContactsLoadingState());
        final result = await repo.getAllContacts();
        result.fold((failure) => emit(ContactsFailureState(errMsg: failure)),
            (contacts) {
          listOfContacts = contacts;
          emit(ContactsSuccessState(contactsList: contacts));
        });
      }
    });
  }
}
