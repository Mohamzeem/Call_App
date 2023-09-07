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

// login get UserCredential
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
      //save id in shared pref
      SharedPref().setString(key: PrefKeys.userId, stringValue: user.user!.uid);
      AppStrings.userId = SharedPref().getString(key: PrefKeys.userId);
      //refresh tokenFcm
      //  await refreshTokenFcmAndRoomId(user.user!.uid);
      return emit(LoginWithEmailPasswordSuccessState(user: user));
    });
  }

//login with google
  Future loginWithGoogle() async {
    emit(LoginWithGoogleLoadingState());
    final result = await repo.loginWithGoogle();
    result.fold(
        (failure) => emit(
            LoginWithEmailPasswordFailureState(errMessage: failure.toString())),
        (user) async {
      await repo.addGoogleUserDatatoFirebase(user.user!.uid,
          user.user!.displayName!, user.user!.email!, user.user!.photoURL!);
      SharedPref().setString(key: PrefKeys.userId, stringValue: user.user!.uid);
      AppStrings.userId = SharedPref().getString(key: PrefKeys.userId);
      return emit(LoginWithGoogleSuccessState(user: user));
    });
  }

//add user data in firebase

  // Future<void> refreshTokenFcmAndRoomId(String userId) async {
  //   String? token = await FirebaseMessaging.instance.getToken();
  //   int roomId = userId.hashCode;
  //   final result =
  //       await FirebaseFirestore.instance.collection('').doc(userId).get();

  //   var userProfile = UserDetailsModel.fromJson(result.data()!);
  //   //refrshToken In Profile
  //   await FirebaseFirestore.instance
  //       .collection(AppStrings.profileCollection)
  //       .doc(userId)
  //       .update({'tokenFcm': token, 'roomId': roomId});

  //   if (userProfile.role == 'Coach') {
  //     await FirebaseFirestore.instance
  //         .collection(AppStrings.coachesCollection)
  //         .doc(userId)
  //         .update({"tokenFcm": token, 'roomId': roomId});
  //   }
  //   if (userProfile.role == 'Employee') {
  //     await FirebaseFirestore.instance
  //         .collection(AppStrings.employeesCollection)
  //         .doc(userId)
  //         .update({"tokenFcm": token, 'roomId': roomId});
  //   }
  // }

//forgot Password
  Future<void> forgotPassword({required String email}) async {
    emit(ForgotPasswordLoadingState());
    final result = await repo.forgotPassword(email: email);
    result.fold(
        (failure) =>
            emit(ForgotPasswordFailureState(errMessage: failure.toString())),
        (unit) => emit(ForgotPasswordSuccessState()));
  }

//logOut
  Future<void> logOut() async {
    emit(LogOutLoadingState());
    await FirebaseAuth.instance.signOut();
    SharedPref().removePreference(key: PrefKeys.userId);
    emit(LogoutSuccessState());
  }
}
