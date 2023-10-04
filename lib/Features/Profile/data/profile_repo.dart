import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<String, UserModel>> getProfile();
  Future<Either<String, Unit>> logOut();
  Future<Either<String, Unit>> logOutUpdateprofile();
}
