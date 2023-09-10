import 'package:call/Core/App/app_dependecies.dart';
import 'package:call/Features/Auth/data/repo/auth_repo_impl.dart';
import 'package:call/Features/Auth/presentation/view/widgets/login_body.dart';
import 'package:call/Features/Auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(repo: sl.get<AuthRepoImpl>()),
      child: const Scaffold(
        body: LoginBody(),
      ),
    );
  }
}
