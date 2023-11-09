import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_text.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isOnline;
  final String photoUrl;
  final Widget audio;
  final Widget video;
  const ChatAppBar(
      {Key? key,
      this.title = '',
      this.isOnline = true,
      this.photoUrl = AppStrings.defaultAppPhoto,
      required this.audio,
      required this.video})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () => MyApp.navigation.goBack(),
        child: const SizedBox(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.mainColor,
          ),
        ),
      ),
      flexibleSpace: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 43.w),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding().w10),
            child: CustomCachedImage(
              photoUrl:
                  photoUrl.isEmpty ? AppStrings.defaultAppPhoto : photoUrl,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isOnline ? AppColors.kGreen : AppColors.kGrey3,
                  ),
                  height: 15.h,
                  width: 15.w,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 220,
            child: CustomText(
              text: title,
              softWrap: false,
              textOverflow: TextOverflow.ellipsis,
              fontType: FontType.medium28,
              color: AppColors.mainColor,
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            audio,
            video,
            SizedBox(width: 15.w),
          ],
        )

        // InkWell(
        //   onTap: audio,
        //   child: Icon(
        //     Icons.call_rounded,
        //     color: AppColors.mainColor,
        //     size: 32.r,
        //   ),
        // ),
        // SizedBox(width: 10.w),

        // InkWell(
        //   onTap: video,
        //   child: Icon(
        //     Icons.video_camera_front_rounded,
        //     color: AppColors.mainColor,
        //     size: 32.r,
        //   ),
        // ),
        // SizedBox(width: 15.w),
      ],
    );
  }
}
