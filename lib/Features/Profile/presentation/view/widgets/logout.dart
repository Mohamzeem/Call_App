import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_dialog.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Features/Auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Widgets/custom_snack_bar.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

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
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLogOutFailureState) {
                CustomSnackBar.showErrorSnackBar(
                    context: context, message: 'Log Out Failed');
              } else if (state is AuthLogOutSuccessState) {
                MyApp.navigation.navigateAndFinish(AppRouter.loginView);
                CustomSnackBar.showSuccessSnackBar(
                    context: context, message: 'Loged Out Successfully');
              }
            },
            builder: (context, state) {
              return InkWell(
                onTap: () => CustomShowDialog.twoButtonDialog(
                  context: context,
                  textBody: 'Are you sure you want to log out',
                  textButton1: 'LOG OUT',
                  textButton2: 'CANCEL',
                  onPressed: () async {
                    await BlocProvider.of<AuthCubit>(context).logOut();
                    //await AuthApi().logOutUpdateprofile();
                  },
                  isLoading: state is AuthLogOutLoadingState,
                ),
                child: const Icon(Icons.arrow_forward_ios_outlined),
              );
            },
          )
        ],
      ),
    );
  }
}
