import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Services/prints/prints_service.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Features/Voice_Call/presentation/view/widgets/voice_buttons_row.dart';
import 'package:flutter/material.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VideoCallBody extends StatefulWidget {
  final String photoUrl;
  final String name;
  const VideoCallBody({
    Key? key,
    required this.photoUrl,
    required this.name,
  }) : super(key: key);

  @override
  State<VideoCallBody> createState() => _VideoCallBodyState();
}

class _VideoCallBodyState extends State<VideoCallBody> {
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
                photoUrl: widget.photoUrl,
                child: Container(),
              ),
            ),
          ),
          CustomText(
            text: widget.name,
            fontType: FontType.medium32,
            color: AppColors.mainColor,
          ),
          SizedBox(height: 10.h),
          const CustomText(
            text: 'Video Calling...',
            fontType: FontType.medium24,
            color: AppColors.kGrey1,
          ),
          const Spacer(),
          VoiceCallButtonsRow(
            callButton: () {
              GoRouter.of(context).pop();
            },
            micButton: () async {
              Prints.route('White foreground with a peach background');
            },
            speakerButton: () {
              Prints.debug(message: 'White foreground with a peach background');
            },
            isCalling: true,
            micOn: true,
            speakerOn: false,
          ),
          SizedBox(height: 30.h)
        ],
      ),
    );
  }
}
