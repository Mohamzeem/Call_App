import 'package:firebase_auth/firebase_auth.dart';

class AuthApi {
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

//forgot password
  Future forgotPassword({required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: "$email.trim()",
    );
  }

  // Get User Profile To get Role And Refresh TokeFmc
}
