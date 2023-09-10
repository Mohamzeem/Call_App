import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BuildVerison extends StatelessWidget {
  const BuildVerison({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomText(
          text: 'Build Version',
          fontType: FontType.medium22,
          color: AppColors.mainColor,
        ),
        const Spacer(),
        // Builder Version
        FutureBuilder<String>(
          future: AppInfoUtil().getAppVersion(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomText(
                text: snapshot.data.toString(),
                fontType: FontType.medium22,
                color: AppColors.kBlack,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
