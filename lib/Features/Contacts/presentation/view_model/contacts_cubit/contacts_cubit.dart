import 'package:call/Features/Contacts/data/models/contact_model.dart';
import 'package:call/Features/Contacts/data/repo/contacts_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  final ContactsRepoImpl repo;
  ContactsCubit({required this.repo}) : super(const ContactsInitialState());
  List<ContactModel> listOfContacts = [];
  // List<ZegoUIKitUser> invitees = [];
  Future getAllContacts() async {
    emit(const ContactsLoadingState());
    final result = await repo.getAllContacts();
    result.fold((failure) => emit(ContactsFailureState(errMsg: failure)),
        (contacts) {
      listOfContacts = contacts;
      // invitees = contacts.cast<ZegoUIKitUser>();
      emit(ContactsSuccessState(contactsList: contacts));
    });
  }
}
