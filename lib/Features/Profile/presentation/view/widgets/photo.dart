import 'package:cached_network_image/cached_network_image.dart';
import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding().h20),
      child: Center(
        child: InkWell(
          onTap: () {},
          child: CachedNetworkImage(
            imageUrl: MyApp.currentUser!.photo!.isEmpty
                ? AppStrings.defaultAppPhoto
                : MyApp.currentUser!.photo!,
            fit: BoxFit.fill,
            imageBuilder: (context, imageProvider) => Container(
              width: 120.h,
              height: 120.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.mainColor, width: 0.5),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.mainColor,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              size: 40,
              color: AppColors.kRed,
            ),
          ),
        ),
      ),
    );
  }
}
