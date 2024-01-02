// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:call/Core/Widgets/custom_text.dart';

class ListItem extends StatelessWidget {
  final String photoUrl;
  final String name;
  final VoidCallback onTap;
  const ListItem({
    Key? key,
    required this.photoUrl,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              CustomCachedImage(
                width: 45,
                height: 45,
                photoUrl: photoUrl,
                child: Container(),
              ),
              SizedBox(width: 20.w),
              SizedBox(
                width: 260.w,
                child: CustomText(
                  text: name,
                  textOverflow: TextOverflow.ellipsis,
                  fontType: FontType.medium22,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.mainColor,
                size: 20,
              ),
            ],
          ),
          Divider(
            thickness: 0.4,
            color: AppColors.mainColor,
            height: 12.h,
          ),
        ],
      ),
    );
  }
}
