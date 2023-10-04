import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileApi {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  Future<UserModel> getProfile() async {
    final result = await fireStore
        .collection(AppStrings.usersCollection)
        .doc(AppStrings.profileDocument)
        .collection(AppStrings.profileDetailsCollection)
        .doc(AppStrings.userId)
        .get();
    return UserModel.fromJson(result.data()!);
  }

//~ logout
  Future<void> logOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }

//~ update profile states after logout (loged & online states)
  Future<void> logOutUpdateprofile() async {
    final id = auth.currentUser!.uid;
    await fireStore
        .collection(AppStrings.usersCollection)
        .doc(AppStrings.profileDocument)
        .collection(AppStrings.profileDetailsCollection)
        .doc(id)
        .update({'isLoged': false, 'isOnline': false});
  }
}
