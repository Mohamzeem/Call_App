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

//lgoin states//
class LoginLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends AuthState {
  final UserCredential user;

  const LoginSuccessState({required this.user});
  @override
  List<Object> get props => [user];
}

class LoginFailureState extends AuthState {
  final String errMessage;

  const LoginFailureState({required this.errMessage});
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
