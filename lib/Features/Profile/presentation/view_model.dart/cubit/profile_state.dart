part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitialState extends ProfileState {}

//~ get user profile from firebase
final class ProfileGetLoadingState extends ProfileState {
  const ProfileGetLoadingState();
}

final class ProfileGetSuccessState extends ProfileState {
  final UserModel userModel;
  const ProfileGetSuccessState({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

final class ProfileGetFailureState extends ProfileState {
  final String errMessage;
  const ProfileGetFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

//~ logout from firebase
final class ProfileLogOutLoadingState extends ProfileState {
  const ProfileLogOutLoadingState();
}

final class ProfileLogOutSuccessState extends ProfileState {
  const ProfileLogOutSuccessState();
}

final class ProfileLogOutFailureState extends ProfileState {
  final String errMessage;
  const ProfileLogOutFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
