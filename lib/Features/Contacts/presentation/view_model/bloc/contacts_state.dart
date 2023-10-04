part of 'contacts_bloc.dart';

sealed class ContactsState extends Equatable {
  const ContactsState();

  @override
  List<Object> get props => [];
}

final class ContactsInitial extends ContactsState {}

final class ContactsLoadingState extends ContactsState {
  const ContactsLoadingState();
}

final class ContactsEmptyState extends ContactsState {
  const ContactsEmptyState();
}

final class ContactsSuccessState extends ContactsState {
  final List<UserModel> contactsList;
  const ContactsSuccessState({required this.contactsList});
  @override
  List<Object> get props => [contactsList];
}

final class ContactsFailureState extends ContactsState {
  final String errMsg;
  const ContactsFailureState({required this.errMsg});
  @override
  List<Object> get props => [errMsg];
}
