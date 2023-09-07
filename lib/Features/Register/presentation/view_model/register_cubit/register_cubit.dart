import 'package:call/Features/Register/data/repo/register_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepoImpl repo;
  RegisterCubit({required this.repo}) : super(RegisterInitialState());

  Future register({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegisterloadingState());
    final result = await repo.register(email: email, password: password);
    result.fold(
        (failure) => emit(RegisterFailureState(errMessage: failure.toString())),
        (user) {
      final id = user.user!.uid; //userid == Uid from firebase
      repo.addUserDatatoFirebase(id, name, email); //save user data in firebase
      emit(RegisterSuccessState(user: user));
//save user data in firebase usercredential
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        name = currentUser.displayName!;
        email = currentUser.email!;
      }
    });
  }
}
