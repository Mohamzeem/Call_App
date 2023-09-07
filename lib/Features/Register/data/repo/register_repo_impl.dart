import 'package:call/Features/Register/data/repo/register_api.dart';
import 'package:call/Features/Register/data/repo/register_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepoImpl implements RegisterRepo {
  final RegisterApi api;

  RegisterRepoImpl({required this.api});

  //register
  @override
  Future<Either<String, UserCredential>> register(
      {required String email, required String password}) async {
    try {
      final result = await api.register(email: email, password: password);
      return right(result);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left('weakPassword');
      } else if (e.code == 'email-already-in-use') {
        return left('emailAlreadyInUse');
      } else if (e.code == 'invalid-email') {
        return left('بريد الكتروني غير صالح');
      } else if (e.code == 'operation-not-allowed') {
        return left('عملية غير مسموح بها');
      }
      return left(e.message.toString());
    }
  }

  @override
  Future<void> addUserDatatoFirebase(
    String id,
    String name,
    String email,
  ) {
    final result = api.addUserDatatoFirebase(id, name, email);
    return result;
  }
}
