import 'package:call/Core/Utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:call/Core/Widgets/custom_text.dart';

class ChatsItem extends StatelessWidget {
  final String photoUrl;
  final String name;
  final String createdAt;
  final String msg;
  final VoidCallback onTap;
  const ChatsItem({
    Key? key,
    required this.photoUrl,
    required this.name,
    required this.createdAt,
    required this.msg,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
          child: InkWell(
            onTap: onTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //^ contact photo
                CustomCachedImage(
                  width: 50,
                  height: 50,
                  photoUrl: photoUrl,
                  child: Container(),
                ),
                SizedBox(
                  width: 200.w,
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //^ contact name
                      CustomText(
                        text: name,
                        textOverflow: TextOverflow.ellipsis,
                        fontType: FontType.medium20,
                        color: AppColors.kWhite,
                      ),
                      //^ contact last msg
                      CustomText(
                        text: msg,
                        textOverflow: TextOverflow.ellipsis,
                        fontType: FontType.medium16,
                        color: AppColors.kWhite.withOpacity(0.8),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                //^ msg created at
                CustomText(
                  text: createdAt,
                  textOverflow: TextOverflow.ellipsis,
                  fontType: FontType.medium16,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 0.5,
          height: 40.h,
          color: Colors.grey.shade500,
        ),
      ],
    );
  }
}
