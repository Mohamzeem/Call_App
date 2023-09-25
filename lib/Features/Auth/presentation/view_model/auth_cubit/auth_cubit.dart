import 'package:call/Core/Services/prints/prints_service.dart';
import 'package:call/Core/Services/shared_prefs/pref_key.dart';
import 'package:call/Core/Services/shared_prefs/shared_pref.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepoImpl repo;
  AuthCubit({required this.repo}) : super(AuthInitialState());

//~ login with email and password and saver user id in sharedpreferences
  Future login({required String email, required String password}) async {
    emit(LoginWithEmailPasswordLoadingState());
    final result = await repo.login(
      email: email,
      password: password,
    );
    result.fold(
        (failure) => emit(
            LoginWithEmailPasswordFailureState(errMessage: failure.toString())),
        (user) async {
//^ save user Id in shared pref..
      SharedPref().setString(key: PrefKeys.userId, stringValue: user.user!.uid);
      AppStrings.userId = SharedPref().getString(key: PrefKeys.userId);
      await repo.updateUserStatus();
//! refresh tokenFcm
      //!  await refreshTokenFcmAndRoomId(user.user!.uid);
      return emit(LoginWithEmailPasswordSuccessState(user: user));
    });
  }

//~ login with google and saver user data to firebase
  Future loginWithGoogle() async {
    emit(LoginWithGoogleLoadingState());
    final result = await repo.loginWithGoogle();
    result.fold(
        (failure) => emit(
            LoginWithEmailPasswordFailureState(errMessage: failure.toString())),
        (user) async {
      await repo.addGoogleUserDatatoFirebase(user.user!.uid,
          user.user!.displayName!, user.user!.email!, user.user!.photoURL!);
//^ save user Id in shared pref..
      SharedPref().setString(key: PrefKeys.userId, stringValue: user.user!.uid);
      AppStrings.userId = SharedPref().getString(key: PrefKeys.userId);
      Prints.success(endPoint: 'Loged in Successfully', message: '$user');
      await repo.updateUserStatus();
      return emit(LoginWithGoogleSuccessState(user: user));
    });
  }

//~ forgot Password
  Future forgotPassword({required String email}) async {
    emit(ForgotPasswordLoadingState());
    final result = await repo.forgotPassword(email: email);
    result.fold(
        (failure) =>
            emit(ForgotPasswordFailureState(errMessage: failure.toString())),
        (unit) => emit(ForgotPasswordSuccessState()));
  }
}

/*
  Future<void> refreshTokenFcmAndRoomId(String userId) async {
    String? token = await FirebaseMessaging.instance.getToken();
    int roomId = userId.hashCode;
    final result =
        await FirebaseFirestore.instance.collection('').doc(userId).get();

    var userProfile = UserDetailsModel.fromJson(result.data()!);
    //refrshToken In Profile
    await FirebaseFirestore.instance
        .collection(AppStrings.profileCollection)
        .doc(userId)
        .update({'tokenFcm': token, 'roomId': roomId});

    if (userProfile.role == 'Coach') {
      await FirebaseFirestore.instance
          .collection(AppStrings.coachesCollection)
          .doc(userId)
          .update({"tokenFcm": token, 'roomId': roomId});
    }
    if (userProfile.role == 'Employee') {
      await FirebaseFirestore.instance
          .collection(AppStrings.employeesCollection)
          .doc(userId)
          .update({"tokenFcm": token, 'roomId': roomId});
    }
  }
  */