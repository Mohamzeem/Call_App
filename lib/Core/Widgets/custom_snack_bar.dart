import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  void showSuccessSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 8,
        duration: const Duration(seconds: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: CustomText(
            text: message,
            fontType: FontType.medium18,
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }

  void showErrorSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 8,
        duration: const Duration(seconds: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: CustomText(
            text: message,
            fontType: FontType.medium18,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
