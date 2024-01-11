import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Core/Widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomShowDialog {
  static Future oneButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton,
    required void Function() onPressed,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.kWhite,
        title: SizedBox(
          width: 200.w,
          height: 200.h,
          child: const Icon(Icons.abc_outlined),
        ),
        content: CustomText(
          text: textBody,
          fontType: FontType.medium14,
        ),
        actions: [
          CustomTextButton(
            text: textButton,
            onPressed: onPressed,
            underline: TextDecoration.none,
          ),
        ],
      ),
    );
  }

  static Future twoButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton1,
    required String textButton2,
    required void Function() onPressed,
    required bool isLoading,
  }) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.kWhite,
        title: Center(
          child: CustomText(
            text: textBody,
            fontType: FontType.medium22,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomTextButton(
                text: isLoading ? 'loading...' : textButton1,
                onPressed: onPressed,
                underline: TextDecoration.none,
              ),
              CustomTextButton(
                text: isLoading ? 'loading...' : textButton2,
                onPressed: () => GoRouter.of(context).pop(),
                underline: TextDecoration.none,
              ),
            ],
          )
        ],
      ),
    );
  }
}
