import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthApi {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  UserModel? userModel;

//~ login in with email and password
  Future<UserCredential> login(
      {required String email, required String password}) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    return userCredential;
  }

//~ login in with google
  Future<UserCredential> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await auth.signInWithCredential(credential);
  }

//~ add google user data to Firebase
  Future<Unit> addGoogleUserDatatoFirebase(
    String id,
    String name,
    String email,
    String photoUrl,
  ) async {
    String? token = await FirebaseMessaging.instance.getToken();
    final userModel =
        UserModel(id: id, name: name, email: email, photo: photoUrl);
    await firestore
        .collection(AppStrings.usersCollection)
        .doc(id)
        .collection(AppStrings.profileCollection)
        .doc(AppStrings.profileDetailsDoc)
        .set(userModel.toJson(id: id, tokenFcm: token!));
    return unit;
  }

//~ forgot password
  Future<Unit> forgotPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: "$email.trim()");
    return unit;
  }

//~ Get User Profile To get Role And Refresh TokeFmc
}
