import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: CustomText(
        text: text,
        fontType: FontType.medium28,
        textDecoration: TextDecoration.underline,
      ),
    );
  }
}
