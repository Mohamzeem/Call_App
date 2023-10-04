// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:call/Core/Services/shared_prefs/pref_key.dart';
import 'package:call/Core/Services/shared_prefs/shared_pref.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:call/Features/Profile/data/profile_repo_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepoImpl repo;
  ProfileCubit({required this.repo}) : super(ProfileInitialState());
  UserModel? userModel;
  void getProfile() async {
    emit(const ProfileGetLoadingState());
    final result = await repo.getProfile();

    result.fold(
      (failure) => emit(ProfileGetFailureState(errMessage: failure)),
      (profile) {
        userModel = profile;
        emit(ProfileGetSuccessState(userModel: profile));
      },
    );
  }

  void logOut() async {
    emit(const ProfileLogOutLoadingState());
    final result = await repo.logOut();
    result
        .fold((failure) => emit(ProfileLogOutFailureState(errMessage: failure)),
            (unit) async {
      SharedPref().removePreference(key: PrefKeys.userId);
      AppStrings.userId = '';
      await repo.logOutUpdateprofile();
      return emit(const ProfileLogOutSuccessState());
    });
  }
}
