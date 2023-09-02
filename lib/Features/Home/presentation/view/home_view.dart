import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText(
          text: 'HOME VIEW',
          fontType: FontType.medium20,
        ),
      ),
    );
  }
}
