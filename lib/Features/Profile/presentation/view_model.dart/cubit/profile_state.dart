part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitialState extends ProfileState {}

//~ logout from firebase
final class ProfileLogOutLoadingState extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileLogOutSuccessState extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileLogOutFailureState extends ProfileState {
  final String errMessage;
  const ProfileLogOutFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
