import 'package:call/Features/Contacts/data/models/contact_model.dart';
import 'package:call/Features/Contacts/data/repo/contacts_api.dart';
import 'package:call/Features/Contacts/data/repo/contacts_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class ContactsRepoImpl extends ContactsRepo {
  final ContactsApi api;
  ContactsRepoImpl({
    required this.api,
  });
  @override
  Future<Either<String, List<ContactModel>>> getAllContacts() async {
    try {
      final result = await api.getAllContacts();
      return right(result);
    } on FirebaseException catch (e) {
      return left(e.code.toString());
    }
  }
}
