import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Features/Auth/presentation/view/widgets/login_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBody extends StatelessWidget {
  final bool isLogin;
  const AuthBody({
    Key? key,
    this.isLogin = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 150.h,
          ),
          const CustomText(
            text: 'Call Me',
            fontType: FontType.medium60,
            color: AppColors.mainColor,
          ),
          const LoginButtons()
          //  isLogin ? const LoginButtons() : const ForgotPasswordButtons()
        ],
      ),
    );
  }
}
