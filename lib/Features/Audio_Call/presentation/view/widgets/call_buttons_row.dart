import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoiceCallButtonsRow extends StatefulWidget {
  const VoiceCallButtonsRow({super.key});

  @override
  State<VoiceCallButtonsRow> createState() => _VoiceCallButtonsRowState();
}

class _VoiceCallButtonsRowState extends State<VoiceCallButtonsRow> {
  bool isCalling = true;
  bool micOn = true;
  bool speakerOn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      padding: EdgeInsets.symmetric(
          vertical: AppPadding().h3, horizontal: AppPadding().w20),
      decoration: BoxDecoration(
        color: AppColors.mainColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              setState(() => micOn = !micOn);
            },
            child: Icon(
              micOn ? Icons.mic_none_rounded : Icons.mic_off,
              size: 35,
            ),
          ),
          InkWell(
            onTap: () {
              MyApp.navigation.goBack();
              setState(() => isCalling = !isCalling);
            },
            child: Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: isCalling ? AppColors.kGreen : AppColors.kRed,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                isCalling ? Icons.call : Icons.call_end,
                size: 35,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() => speakerOn = !speakerOn);
            },
            child: Icon(
              speakerOn ? Icons.volume_up_sharp : Icons.volume_off,
              size: 35,
            ),
          )
        ],
      ),
    );
  }
}
