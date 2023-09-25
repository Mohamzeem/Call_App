import 'package:call/Core/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularLoading extends StatelessWidget {
  final Color? color;
  final double height;
  final double width;
  final double? strokeWidth;
  const CustomCircularLoading({
    super.key,
    this.color,
    required this.height,
    required this.width,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height.h,
        width: width.w,
        child: CircularProgressIndicator(
          color: color ?? AppColors.mainColor,
          strokeWidth: strokeWidth ?? 5.h,
        ),
      ),
    );
  }
}
