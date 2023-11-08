import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<String, UserCredential>> login(
      {required String email, required String password});
  Future<Either<String, UserModel>> getProfile();
  Future<Either<String, UserCredential>> loginWithGoogle();
  Future<Either<String, Unit>> updateUserStatus();
  Future<Either<String, Unit>> addGoogleUserDatatoFirebase(
      String id, String name, String email, String photo);
  Future<Either<String, Unit>> forgotPassword({required String email});
}
