import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserMsg extends StatelessWidget {
  final String msg;
  final String createdAt;
  final String photoUrl;

  const UserMsg({
    super.key,
    required this.msg,
    required this.createdAt,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCachedImage(
            width: 35,
            height: 35,
            photoUrl: photoUrl,
            child: Container(),
          ),
          SizedBox(width: 8.w),
          Container(
            constraints: BoxConstraints(maxWidth: 260.w),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: msg,
                    fontType: FontType.medium20,
                    color: AppColors.kWhite,
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
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
