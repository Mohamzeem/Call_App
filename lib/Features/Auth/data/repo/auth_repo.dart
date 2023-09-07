import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  //login with email and password
  Future<Either<String, UserCredential>> login(
      {required String email, required String password});

  //login with google
  Future<Either<String, UserCredential>> loginWithGoogle();

  Future<void> addGoogleUserDatatoFirebase(
      String id, String name, String email, String photo);

  //forgot password
  Future<Either<String, Unit>> forgotPassword({required String email});
}
