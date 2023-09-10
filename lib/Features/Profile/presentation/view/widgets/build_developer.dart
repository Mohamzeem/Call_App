import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BuildDeveloper extends StatelessWidget {
  const BuildDeveloper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding().h25),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: 'Build Developer',
            fontType: FontType.medium22,
            color: AppColors.mainColor,
          ),
          Row(
            children: [
              CustomText(
                text: 'Call Me App',
                fontType: FontType.medium22,
                color: AppColors.kBlack,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
