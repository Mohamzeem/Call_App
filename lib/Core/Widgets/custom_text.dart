import 'package:call/Core/Utils/font_size_scale.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontType? fontType;
  final Color? color;
  final TextDecoration? textDecoration;
  final double? height;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? softWrap;
  final bool isTitle;
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.color,
    this.textDecoration,
    this.height,
    this.textOverflow,
    this.textAlign,
    this.maxLines,
    this.fontType,
    this.softWrap,
    this.isTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? theme;

    if (fontType == FontType.medium10) {
      theme = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 10.sp,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
          color: color,
          decoration: textDecoration,
          height: height);
    } else if (fontType == FontType.medium11) {
      theme = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 11.sp,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
          color: color,
          decoration: textDecoration,
          height: height);
    } else if (fontType == FontType.medium12) {
      theme = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 12.sp,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
          color: color,
          decoration: textDecoration,
          height: height);
    } else if (fontType == FontType.medium14) {
      theme = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 14.sp,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
          color: color,
          decoration: textDecoration,
          height: height);
    } else if (fontType == FontType.medium16) {
      theme = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 16.sp,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
          color: color,
          decoration: textDecoration,
          height: height);
    } else if (fontType == FontType.medium18) {
      theme = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 18.sp,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
          color: color,
          decoration: textDecoration,
          height: height);
    } else if (fontType == FontType.medium20) {
      theme = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 20.sp,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
          color: color,
          decoration: textDecoration,
          height: height);
    } else if (fontType == FontType.medium22) {
      theme = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 22.sp,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
          color: color,
          decoration: textDecoration,
          height: height);
    } else if (fontType == FontType.medium24) {
      theme = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 24.sp,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
          color: color,
          decoration: textDecoration,
          height: height);
    } else if (fontType == FontType.medium60) {
      theme = Theme.of(context).textTheme.displayLarge?.copyWith(
          fontSize: 60.sp,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
          color: color,
          decoration: textDecoration,
          height: height);
    }
    return Text(
      text,
      softWrap: softWrap,
      style: theme,
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxLines,
      textScaleFactor: ScaleSize.textScaleFactor(context),
    );
  }
}
