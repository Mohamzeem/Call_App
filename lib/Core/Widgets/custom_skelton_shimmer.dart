import 'package:call/Core/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSkeltonShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;
  const CustomSkeltonShimmer({
    super.key,
    this.height = 30,
    this.width = double.infinity,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.kGrey.withOpacity(0.6),
      highlightColor: AppColors.kGrey.withOpacity(0.4),
      child: Container(
        height: height!.h,
        width: width!.w,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.kGrey.withOpacity(0.4),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 14),
          ),
        ),
      ),
    );
  }
}
