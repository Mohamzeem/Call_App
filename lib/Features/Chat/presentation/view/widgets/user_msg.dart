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
    double width = 280;
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCachedImage(
            width: 35,
            height: 35,
            photoUrl: photoUrl,
            child: Container(),
          ),
          SizedBox(width: 8.w),
          Container(
            constraints: BoxConstraints(maxWidth: 280.h),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: msg,
                fontType: FontType.medium20,
                color: AppColors.kWhite,
              ),
            ),
          ),
          const Spacer(),
          CustomText(
            textAlign: TextAlign.end,
            text: createdAt,
            fontType: FontType.medium16,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }
}
