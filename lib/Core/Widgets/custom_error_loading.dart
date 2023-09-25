import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorLoading extends StatelessWidget {
  final String errMsg;
  const CustomErrorLoading({super.key, required this.errMsg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_outlined,
            size: 50.r,
            color: AppColors.kRed,
          ),
          SizedBox(height: 20.h),
          CustomText(
            text: errMsg,
            color: AppColors.kBlack,
            fontType: FontType.medium18,
          ),
        ],
      ),
    );
  }
}
