import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class RegisterApi {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
//~ register user in firebase
  Future<UserCredential> register(
      {required String email, required String password}) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: "${email.trim()}${AppStrings.defaultEmail}",
      password: password.trim(),
    );
    return userCredential;
  }

//~ add user data in firebase
  Future<void> addUserDatatoFirebase(
    String id,
    String name,
    String email,
  ) async {
    String? token = await FirebaseMessaging.instance.getToken();
    final userModel = UserModel(
      id: id,
      name: name,
      email: email,
    );
    await firestore
        .collection(AppStrings.usersCollection)
        .doc(AppStrings.profileDocument)
        .collection(AppStrings.profileDetailsCollection)
        .doc(id)
        .set(userModel.toJson(
            id: id, tokenFcm: token!, isOnline: false, isloged: false));
  }
}
