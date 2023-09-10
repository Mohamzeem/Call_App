import 'package:call/Core/Utils/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileApi {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
//~ logout
  Future<Unit> logOut() async {
    await auth.signOut();
    return unit;
  }

//~ update profile states afrer logout
  Future<Unit> logOutUpdateprofile(
    String id,
  ) async {
    FirebaseFirestore.instance
        .collection(AppStrings.usersCollection)
        .doc(id)
        .collection(AppStrings.profileCollection)
        .doc(AppStrings.profileDetailsDoc)
        .update({'isLoged': false, 'isOnline': false});
    return unit;
  }
}
