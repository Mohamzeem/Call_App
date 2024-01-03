import 'package:cached_network_image/cached_network_image.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:call/Core/Utils/app_colors.dart';

class CustomCachedImage extends StatelessWidget {
  final String photoUrl;
  final Widget child;
  final double? width;
  final double? height;
  const CustomCachedImage({
    Key? key,
    required this.photoUrl,
    required this.child,
    this.width = 50,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photoUrl.isEmpty ? AppStrings.defaultAppPhoto : photoUrl,
      fit: BoxFit.fill,
      imageBuilder: (context, imageProvider) => Container(
        width: width!.w,
        height: height!.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            // color: AppColors.mainColor,
            width: 0.5,
          ),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
        child: child,
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        size: 40,
        color: AppColors.kRed,
      ),
    );
  }
}
