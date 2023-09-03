import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  //login
  Future<Either<String, UserCredential>> login(
      {required String email, required String password});

  //forgot password
  Future<Either<String, Unit>> forgotPassword({required String email});
}
