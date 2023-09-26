import 'package:call/Core/App/app_dependecies.dart';
import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Features/Profile/data/profile_repo_impl.dart';
import 'package:call/Features/Profile/presentation/view/widgets/body.dart';
import 'package:call/Features/Profile/presentation/view_model.dart/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(repo: sl.get<ProfileRepoImpl>()),
      child: const SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(isProfile: true, isArrowBack: true),
          body: ProfileBody(),
        ),
      ),
    );
  }
}
