// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => [];
}

//login with email and password
class LoginWithEmailPasswordLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginWithEmailPasswordSuccessState extends AuthState {
  final UserCredential user;
  const LoginWithEmailPasswordSuccessState({required this.user});
  @override
  List<Object> get props => [user];
}

class LoginWithEmailPasswordFailureState extends AuthState {
  final String errMessage;
  const LoginWithEmailPasswordFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

//login with google
class LoginWithGoogleLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginWithGoogleSuccessState extends AuthState {
  final UserCredential user;
  const LoginWithGoogleSuccessState({required this.user});
  @override
  List<Object> get props => [user];
}

class LoginWithGoogleFailureState extends AuthState {
  final String errMessage;
  const LoginWithGoogleFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}

//logOut states//
class LogoutSuccessState extends AuthState {
  @override
  List<Object> get props => [];
}

class LogOutLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

//forgot password states//
class ForgotPasswordLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class ForgotPasswordSuccessState extends AuthState {
  @override
  List<Object> get props => [];
}

class ForgotPasswordFailureState extends AuthState {
  final String errMessage;
  const ForgotPasswordFailureState({
    required this.errMessage,
  });
  @override
  List<Object> get props => [];
}
