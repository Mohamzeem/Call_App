import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static Future showSuccessSnackBar(
      {required BuildContext context, required String message}) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 8,
        duration: const Duration(seconds: 2),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        content: Center(
          child: CustomText(
            text: message,
            fontType: FontType.medium24,
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }

  static Future showErrorSnackBar(
      {required BuildContext context, required String message}) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 8,
        duration: const Duration(seconds: 2),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        content: Center(
          child: CustomText(
            text: message,
            fontType: FontType.medium24,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
