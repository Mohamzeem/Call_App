import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  final bool isArrowBack;
  final bool isOnline;
  final String photoUrl;
  const CustomAppBar({
    Key? key,
    this.isArrowBack = false,
    this.isOnline = true,
    this.photoUrl =
        "https://firebasestorage.googleapis.com/v0/b/call-me-98459.appspot.com/o/icons8-account-40.png?alt=media&token=07e51d3d-b60c-4f84-ad0a-f35a747545f3",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isArrowBack
                ? const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.mainColor,
                  )
                : SizedBox(width: 25.w),
            const CustomText(
              text: 'Call Me',
              fontType: FontType.medium32,
              color: AppColors.mainColor,
            ),
            InkWell(
              onTap: () => MyApp.navigation.navigateTo(AppRouter.profileView),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(photoUrl),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.mainColor)),
                height: 50.h,
                width: 50.w,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isOnline ? AppColors.kGreen : AppColors.kGrey3),
                    height: 15.h,
                    width: 15.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
