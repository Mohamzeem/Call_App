// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:call/Features/Profile/data/profile_api.dart';
import 'package:call/Features/Profile/data/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileApi api;
  ProfileRepoImpl({
    required this.api,
  });
  @override
  Future<Either<String, Unit>> logOut() async {
    try {
      api.logOut();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code.toString());
    }
  }

  @override
  Future<Either<String, Unit>> logOutUpdateprofile() async {
    try {
      await api.logOutUpdateprofile();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code.toString());
    }
  }
}
