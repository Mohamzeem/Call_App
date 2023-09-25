import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class ContactsRepo {
  Future<Either<String, List<UserModel>>> getAllContacts();
}
