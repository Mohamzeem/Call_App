// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:call/Features/Voice_Call/data/audio_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_padding.dart';

class VoiceCallButtonsRow extends StatefulWidget {
  final VoidCallback callButton;
  final VoidCallback micButton;
  final VoidCallback speakerButton;
  const VoiceCallButtonsRow({
    Key? key,
    required this.callButton,
    required this.micButton,
    required this.speakerButton,
  }) : super(key: key);

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
              widget.micButton;
              setState(() => micOn = !micOn);
            },
            child: Icon(
              micOn ? Icons.mic_none_rounded : Icons.mic_off,
              size: 35,
            ),
          ),
          InkWell(
            onTap: () {
              widget.callButton;
              // setState(() => isCalling = !isCalling);
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
              widget.speakerButton;
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
