import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListItem extends StatelessWidget {
  final String photoUrl;
  final String name;
  final bool isOnline;
  const ListItem({
    super.key,
    required this.photoUrl,
    required this.isOnline,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => MyApp.navigation.navigateTo(AppRouter.contactDetailsView),
      child: Column(
        children: [
          Row(
            children: [
              CustomCachedImage(
                width: 45,
                height: 45,
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
              SizedBox(width: 20.w),
              CustomText(
                text: name,
                fontType: FontType.medium22,
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
