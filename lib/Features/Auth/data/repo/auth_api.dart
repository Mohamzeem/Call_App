import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthApi {
  final firestore = FirebaseFirestore.instance;

  // login in
  Future<UserCredential> login(
      {required String email, required String password}) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: "$email.trim()",
      password: password.trim(),
    );
    return userCredential;
  }

  Future<UserCredential> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  addGoogleUserDatatoFirebase(
    String id,
    String name,
    String email,
    String photoUrl,
  ) async {
    String? token = await FirebaseMessaging.instance.getToken();
    final userModel =
        UserModel(id: id, name: name, email: email, photo: photoUrl);
    await firestore
        .collection('Users')
        .doc(id)
        .collection('Profile')
        .doc('profileDetails')
        .set(userModel.toJson(id: id, tokenFcm: token!));
  }

//forgot password
  Future forgotPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: "$email.trim()",
    );
    return;
  }

  // Get User Profile To get Role And Refresh TokeFmc
}
