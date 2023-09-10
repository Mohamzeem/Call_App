part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitialState extends RegisterState {
  @override
  List<Object> get props => [];
}

//~switch show password state
class SwitchShowPasswordState extends RegisterState {
  @override
  List<Object> get props => [];
}

//~register with email and password state
class RegisterloadingState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSuccessState extends RegisterState {
  final UserCredential user;
  const RegisterSuccessState({required this.user});
  @override
  List<Object> get props => [user];
}

class RegisterFailureState extends RegisterState {
  final String errMessage;
  const RegisterFailureState({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
