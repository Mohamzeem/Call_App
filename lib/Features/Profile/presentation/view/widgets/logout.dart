import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Widgets/custom_snack_bar.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:call/Features/Profile/presentation/view_model.dart/cubit/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Logout extends StatelessWidget {
  const Logout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding().h25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomText(
            text: 'Log Out',
            fontType: FontType.medium22,
            color: AppColors.mainColor,
          ),
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
            child: InkWell(
              onTap: () => BlocProvider.of<ProfileCubit>(context).logOut(),
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          )
        ],
      ),
    );
  }
}
