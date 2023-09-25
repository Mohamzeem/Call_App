import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_button.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          CustomButton(
            onPressed: onPressed,
            text: textButton,
            fontType: FontType.medium16,
            width: 320.w,
            height: 45.h,
            lastRadius: 10,
            threeRadius: 10,
          )
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
      // barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.kWhite,
        title: Padding(
          padding: EdgeInsets.only(
            top: AppPadding().h30,
            bottom: AppPadding().h20,
          ),
          child: Center(
            child: CustomText(
              text: textBody,
              fontType: FontType.medium22,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                backgroundColor: AppColors.kRed,
                onPressed: onPressed,
                text: textButton1,
                fontType: FontType.medium18,
                width: 90.w,
                height: 35.h,
                isLoading: isLoading,
                lastRadius: 10,
                threeRadius: 10,
              ),
              CustomButton(
                onPressed: () {
                  MyApp.navigation.goBack();
                },
                text: textButton2,
                fontType: FontType.medium18,
                width: 90.w,
                height: 35.h,
                lastRadius: 10,
                threeRadius: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
