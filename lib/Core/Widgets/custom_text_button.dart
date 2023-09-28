// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextDecoration? underline;
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.underline = TextDecoration.underline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: CustomText(
        text: text,
        fontType: FontType.medium24,
        textDecoration: underline,
        color: AppColors.mainColor,
      ),
    );
  }
}
