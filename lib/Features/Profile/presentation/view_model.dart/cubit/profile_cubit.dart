// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:call/Core/Services/shared_prefs/pref_key.dart';
import 'package:call/Core/Services/shared_prefs/shared_pref.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:call/Features/Profile/data/profile_repo_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepoImpl repo;
  ProfileCubit({required this.repo}) : super(ProfileInitialState());

  void logOut() async {
    emit(ProfileLogOutLoadingState());
    final result = await repo.logOut();
    result
        .fold((failure) => emit(ProfileLogOutFailureState(errMessage: failure)),
            (unit) {
      SharedPref().removePreference(key: PrefKeys.userId);
      AppStrings.userId = '';
      final id = FirebaseAuth.instance.currentUser!.uid;
      repo.logOutUpdateprofile(id);
      return emit(ProfileLogOutSuccessState());
    });
  }
}
