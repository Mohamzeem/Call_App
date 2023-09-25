import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Core/routes/app_routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isArrowBack;
  final bool isOnline;
  final String photoUrl;
  final bool isProfile;
  const CustomAppBar({
    Key? key,
    this.isArrowBack = false,
    this.isOnline = true,
    this.photoUrl = AppStrings.defaultAppPhoto,
    this.isProfile = false,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isArrowBack
          ? InkWell(
              onTap: () => MyApp.navigation.goBack(),
              child: const SizedBox(
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.mainColor,
                ),
              ),
            )
          : const SizedBox(),
      title: CustomText(
        text: isProfile ? 'Profile' : 'Call Me',
        fontType: FontType.medium32,
        color: AppColors.mainColor,
      ),
      centerTitle: true,
      actions: [
        isProfile
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
                child: InkWell(
                  onTap: () =>
                      MyApp.navigation.navigateTo(AppRouter.profileView),
                  child: CustomCachedImage(
                    photoUrl: photoUrl,
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
              )
      ],
    );
  }
}
