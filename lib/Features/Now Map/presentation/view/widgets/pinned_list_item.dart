import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinnedListItem extends StatelessWidget {
  final String photoUrl;
  final String name;

  const PinnedListItem({super.key, required this.photoUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              //^ contact photo
              Container(
                margin: EdgeInsets.only(bottom: 8.h),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: CustomCachedImage(
                  width: 60,
                  height: 60,
                  photoUrl: photoUrl,
                  child: const SizedBox.shrink(),
                ),
              ),
              //^ contact name
              CustomText(
                text: name.substring(0, 10),
                color: AppColors.kWhite,
                fontType: FontType.medium16,
                maxLines: 10,
              ),
            ],
          )),
    );
  }
}
