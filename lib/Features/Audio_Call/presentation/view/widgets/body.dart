import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Features/Audio_Call/presentation/view/widgets/call_buttons_row.dart';
import 'package:flutter/material.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoiceCallBody extends StatelessWidget {
  final String photoUrl;
  final String name;
  const VoiceCallBody({
    Key? key,
    required this.photoUrl,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding().w20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppPadding().h25),
            child: Center(
              child: CustomCachedImage(
                width: 200,
                height: 200,
                photoUrl: photoUrl,
                child: Container(),
              ),
            ),
          ),
          CustomText(
            text: name,
            fontType: FontType.medium32,
            color: AppColors.mainColor,
          ),
          SizedBox(height: 10.h),
          const CustomText(
            text: 'Calling...',
            fontType: FontType.medium24,
            color: AppColors.kGrey1,
          ),
          const Spacer(),
          const VoiceCallButtonsRow(),
          SizedBox(height: 30.h)
        ],
      ),
    );
  }
}
