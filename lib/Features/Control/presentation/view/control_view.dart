import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Core/Widgets/custom_button.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlView extends StatelessWidget {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(),
            CustomText(
              text: AppStrings.userId!,
              fontType: FontType.medium28,
            ),
            CustomButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  var data = prefs.getKeys();
                  debugPrint('SHARED_PREFS === $data'
                      '\n USER_ID === ${AppStrings.userId}');
                },
                text: 'Prefs',
                width: 100,
                height: 40)
          ],
        ),
      ),
    );
  }
}
