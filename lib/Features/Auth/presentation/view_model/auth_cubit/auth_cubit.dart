import 'package:call/Core/Services/prints/prints_service.dart';
import 'package:call/Core/Services/shared_prefs/pref_key.dart';
import 'package:call/Core/Services/shared_prefs/shared_pref.dart';
import 'package:call/Core/Services/zego_services/login_service.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_snack_bar.dart';
import 'package:call/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepoImpl repo;
  AuthCubit({required this.repo}) : super(AuthInitialState());
  UserModel? userModel;
  bool isFirstTime = true;

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
      SharedPref().setString(
          key: PrefKeys.userId,
          stringValue: user.user!.uid); //* save user Id in shared pref
      AppStrings.userId = SharedPref().getString(key: PrefKeys.userId);
      await repo.updateUserStatus(); //* update user status
      await getProfile(); //* get profile
//todo: refresh tokenFcm
//!  await refreshTokenFcmAndRoomId(user.user!.uid);
      return emit(LoginWithEmailPasswordSuccessState(user: user));
    });
  }

//~ get user profile
  Future getProfile() async {
    emit(const AuthGetProfileLoadingState());
    final result = await repo.getProfile();
    result.fold(
      (failure) => emit(AuthGetProfileFailureState(errMessage: failure)),
      (profile) {
        userModel = profile;
        SharedPref().setString(
            key: PrefKeys.userPhoto,
            stringValue: profile.photo!); //* save user Id in shared pref
        AppStrings.userPhoto = SharedPref().getString(key: PrefKeys.userPhoto);
        SharedPref().setString(
            key: PrefKeys.userName,
            stringValue: profile.name!); //* save user Id in shared pref
        AppStrings.userName = SharedPref().getString(key: PrefKeys.userName);
        emit(AuthGetProfileSuccessState(userModel: profile));
      },
    );
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
      SharedPref().setString(
          key: PrefKeys.userId,
          stringValue: user.user!.uid); //* save user Id in shared pref
      AppStrings.userId = SharedPref().getString(key: PrefKeys.userId);
      Prints.success(endPoint: 'Loged in Successfully', message: '$user');
      await repo.updateUserStatus(); //* update user status
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

//~log out
  Future logOut() async {
    emit(const AuthLogOutLoadingState());
    await _logOutUpdateprofile(); //* update user status
    await FirebaseAuth.instance.signOut();
    //  await GoogleSignIn().signOut();
    SharedPref().removePreference(
        key: PrefKeys.userId); //* remove user Id in shared pref
    AppStrings.userId = '';
    Prints.success(message: "### User logout Successfully", endPoint: '');
    ZegoServices().closeZego(); //~ close zego service
    emit(const AuthLogOutSuccessState());
  }

//~ update profile states after logout (loged & online states)
  Future _logOutUpdateprofile() async {
    final id = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection(AppStrings.usersCollection)
        .doc(AppStrings.profileDocument)
        .collection(AppStrings.profileDetailsCollection)
        .doc(id)
        .update({'isLoged': false, 'isOnline': false});
  }

//~ app connection checker
  void checkInternet(BuildContext context) {
    InternetConnectionChecker().onStatusChange.listen((event) {
      switch (event) {
        case InternetConnectionStatus.connected:
          if (isFirstTime) {
            isFirstTime = false;
            return;
          }
          CustomSnackBar.showSuccessSnackBar(
              context: context, message: 'Internet connection is active');
          break;
        case InternetConnectionStatus.disconnected:
          CustomSnackBar.showErrorSnackBar(
              context: context, message: 'Internet connection is disconnected');
          break;
      }
    });
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