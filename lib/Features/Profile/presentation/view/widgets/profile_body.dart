import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_button.dart';
import 'package:call/Core/Widgets/custom_snack_bar.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:call/Features/Profile/presentation/view/widgets/build_developer.dart';
import 'package:call/Features/Profile/presentation/view/widgets/build_version.dart';
import 'package:call/Features/Profile/presentation/view/widgets/profile_photo.dart';
import 'package:call/Features/Profile/presentation/view_model.dart/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding().w25),
      child: Column(
        children: [
//~ profile photo
          const ProfilePhoto(),
//~ build developer
          const BuildDeveloper(),
//~ build developer
          const BuildVerison(),
          const SizedBox(height: 30),
//~ logut button
          BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileLogOutFailureState) {
                CustomSnackBar().showErrorSnackBar(
                    context: context, message: 'Log Out Failed');
              } else if (state is ProfileLogOutSuccessState) {
                MyApp.navigation.navigateAndFinish(AppRouter.loginView);
                CustomSnackBar().showSuccessSnackBar(
                    context: context, message: 'Log Out Successfully');
              }
            },
            child: CustomButton(
              onPressed: () => BlocProvider.of<ProfileCubit>(context).logOut(),
              text: 'Log Out',
              width: 250,
              height: 45,
            ),
          )
        ],
      ),
    );
  }
}
