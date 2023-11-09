import 'dart:convert';

import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Services/prints/prints_service.dart';
import 'package:call/Core/Services/shared_prefs/pref_key.dart';
import 'package:call/Core/Services/shared_prefs/shared_pref.dart';
import 'package:call/Core/Services/zego_services/avatar_build.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepoImpl repo;
  AuthCubit({required this.repo}) : super(AuthInitialState());
  UserModel? userModel;

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
      await getProfile();
      //~ close zego service
      await _initZego();
      //todo: get user profile from firebase
//! refresh tokenFcm
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

//~log out
  Future logOut() async {
    emit(const AuthLogOutLoadingState());
    await _logOutUpdateprofile();
    await FirebaseAuth.instance.signOut();
    //  await GoogleSignIn().signOut();
    SharedPref().removePreference(key: PrefKeys.userId);
    AppStrings.userId = '';
    Prints.success(message: "### User logout Successfully", endPoint: '');
    //~ close zego service
    await ZegoUIKitPrebuiltCallInvitationService().uninit();
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

//~ init zego service
  Future _initZego() async {
    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: AppStrings.zegoAppID,
      appSign: AppStrings.zegoAppSign,
      userID: MyApp.currentUser!.id!,
      userName: MyApp.currentUser!.name!,
      notifyWhenAppRunningInBackgroundOrQuit: false,
      plugins: [ZegoUIKitSignalingPlugin()],
      requireConfig: (ZegoCallInvitationData data) {
        final config = (data.invitees.length > 1)
            ? ZegoCallType.videoCall == data.type
                ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
                : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
            : ZegoCallType.videoCall == data.type
                ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
                : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

        config.avatarBuilder = avatarBuilder;

        /// support minimizing, show minimizing button
        config.topMenuBarConfig.isVisible = true;
        config.topMenuBarConfig.buttons
            .insert(0, ZegoMenuBarButtonName.minimizingButton);

        return config;
      },
    );
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