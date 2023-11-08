import 'package:call/Features/Auth/data/repo/auth_api.dart';
import 'package:call/Features/Auth/data/repo/auth_repo.dart';
import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthApi api;

  AuthRepoImpl({required this.api});

  @override
  Future<Either<String, UserCredential>> login(
      {required String email, required String password}) async {
    try {
      final result = await api.login(email: email, password: password);
      return right(result);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('userNotFound');
      } else if (e.code == 'wrong-password') {
        return left('wrongPassword');
      } else if (e.code == 'invalid-email') {
        return left('invalidId');
      }
      return left('loginFailed');
    }
  }

  @override
  Future<Either<String, UserCredential>> loginWithGoogle() async {
    try {
      final result = await api.loginWithGoogle();
      return right(result);
    } on FirebaseAuthException catch (e) {
      return left(e.code.toString());
    }
  }

  @override
  Future<Either<String, UserModel>> getProfile() async {
    try {
      final result = await api.getProfile();
      return right(result);
    } on FirebaseException catch (e) {
      return left(e.code.toString());
    }
  }

  @override
  Future<Either<String, Unit>> updateUserStatus() async {
    try {
      await api.updateUserStatus();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.code.toString());
    }
  }

  @override
  Future<Either<String, Unit>> addGoogleUserDatatoFirebase(
    String id,
    String name,
    String email,
    String photoUrl,
  ) async {
    try {
      await api.addGoogleUserDatatoFirebase(id, name, email, photoUrl);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.code.toString());
    }
  }

  @override
  Future<Either<String, Unit>> forgotPassword({required String email}) async {
    try {
      await api.forgotPassword(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.code.toString());
    }
  }
}

/*
String getMessageFromErrorCode() {
    switch (this.errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";
        break;
      default:
        return "Login failed. Please try again.";
        break;
    }
  }
 */
