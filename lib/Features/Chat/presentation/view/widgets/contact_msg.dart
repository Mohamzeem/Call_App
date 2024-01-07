import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactMsg extends StatelessWidget {
  final String msg;
  final String createdAt;

  const ContactMsg({
    super.key,
    required this.msg,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 300.w),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.greenAccent.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: msg,
                    fontType: FontType.medium20,
                    color: AppColors.kBlack,
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(top: 5.h),
                //   child: Align(
                //     alignment: Alignment.centerRight,
                //     child: CustomText(
                //       text: createdAt,
                //       fontType: FontType.medium16,
                //       color: Colors.grey.shade600,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
