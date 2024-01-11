import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Features/Auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:call/Features/Profile/presentation/view/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final userModel = BlocProvider.of<AuthCubit>(context).userModel;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Hello,,, ${userModel!.name!}',
        isProfile: true,
        isArrowBack: true,
      ),
      body: const ProfileBody(),
    );
  }
}
