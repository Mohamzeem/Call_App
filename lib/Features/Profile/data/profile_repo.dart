import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<String, Unit>> logOut();
  Future<Either<String, Unit>> logOutUpdateprofile(String id);
}
