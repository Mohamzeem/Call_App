import 'package:call/Core/Utils/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileApi {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
//~ logout
  Future logOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }

//~ update profile states after logout (loged & online states)
  Future logOutUpdateprofile() async {
    final id = auth.currentUser!.uid;
    await fireStore
        .collection(AppStrings.usersCollection)
        .doc(id)
        .collection(AppStrings.profileCollection)
        .doc(AppStrings.profileDetailsDoc)
        .update({'isLoged': false, 'isOnline': false});
  }
}
