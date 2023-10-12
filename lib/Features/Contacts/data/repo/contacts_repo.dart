import 'package:call/Features/Contacts/data/models/contact_model.dart';
import 'package:dartz/dartz.dart';

abstract class ContactsRepo {
  Future<Either<String, List<ContactModel>>> getAllContacts();
}
