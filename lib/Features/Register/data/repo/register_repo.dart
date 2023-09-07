import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterRepo {
  //register
  Future<Either<String, UserCredential>> register(
      {required String email, required String password});

  Future<void> addUserDatatoFirebase(String id, String name, String email);
}
