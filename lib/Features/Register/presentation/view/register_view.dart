import 'package:call/Core/App/app_dependecies.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Features/Register/data/repo/register_repo_impl.dart';
import 'package:call/Features/Register/presentation/view/widgets/body.dart';
import 'package:call/Features/Register/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(repo: sl.get<RegisterRepoImpl>()),
      child: const Scaffold(
        backgroundColor: AppColors.kWhite,
        body: RegisterBody(),
      ),
    );
  }
}
