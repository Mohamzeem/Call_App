import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactMsg extends StatelessWidget {
  final String msg;
  final String createdAt;
  final String photoUrl;

  const ContactMsg({
    super.key,
    required this.msg,
    required this.createdAt,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomText(
            text: createdAt,
            fontType: FontType.medium16,
            color: Colors.grey.shade600,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // const Spacer(),
                Container(
                  constraints: BoxConstraints(maxWidth: 280.w),
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
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                CustomCachedImage(
                  width: 35,
                  height: 35,
                  photoUrl: photoUrl,
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
