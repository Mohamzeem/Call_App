import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Enums/font_enum.dart';
import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Widgets/custom_text.dart';
import 'package:call/Core/Widgets/custom_toast.dart';
import 'package:call/Features/Voice_Call/data/audio_services.dart';
import 'package:call/Features/Voice_Call/presentation/view/widgets/voice_buttons_row.dart';
import 'package:call/Features/Voice_Call/presentation/view_model/voice_call_cubit/voice_call_cubit.dart';
import 'package:flutter/material.dart';
import 'package:call/Core/Utils/app_padding.dart';
import 'package:call/Core/Widgets/custom_cached_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoiceCallBody extends StatefulWidget {
  final String photoUrl;
  final String name;
  const VoiceCallBody({
    Key? key,
    required this.photoUrl,
    required this.name,
  }) : super(key: key);

  @override
  State<VoiceCallBody> createState() => _VoiceCallBodyState();
}

class _VoiceCallBodyState extends State<VoiceCallBody> {
  @override
  void initState() {
    super.initState();
    context.read<VoiceCallCubit>().initEngine();
    context.read<VoiceCallCubit>().isCalling == true
        ? VoiceServices().joinVoiceCall()
        : VoiceServices().leaveVoiceCall();
  }

  @override
  void dispose() {
    context.read<VoiceCallCubit>().leaveVoiceCall();
    super.dispose();
  }

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
            text: 'Calling...',
            fontType: FontType.medium24,
            color: AppColors.kGrey1,
          ),
          const Spacer(),
          BlocBuilder<VoiceCallCubit, VoiceCallState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<VoiceCallCubit>(context);
              return VoiceCallButtonsRow(
                isCalling: cubit.isCalling,
                micOn: cubit.micOn,
                speakerOn: cubit.speakerOn,
                micButton: () {
                  cubit.editMicOn();
                  // debugPrint('#### ${cubit.micOn}');
                  if (cubit.micOn == true) {
                    CustomToast().showToastSuccessTop(
                        context: context, message: 'Mic On');
                  } else {
                    CustomToast().showToastErrorTop(
                        context: context, message: 'Mic Off');
                  }
                },
                callButton: () {
                  cubit.leaveVoiceCall();
                  MyApp.navigation.goBack();
                  // debugPrint('#### go back');
                  cubit.editIsCalling();
                  // debugPrint('#### ${cubit.isCalling}');
                  if (cubit.isCalling == false) {
                    CustomToast().showToastSuccessTop(
                        context: context, message: 'Call Ended');
                  } else {
                    CustomToast().showToastErrorTop(
                        context: context, message: 'Call Cancelled');
                  }
                },
                speakerButton: () {
                  cubit.editSpeakerOn();
                  // debugPrint('#### ${cubit.speakerOn}');
                  if (cubit.speakerOn == true) {
                    CustomToast().showToastSuccessTop(
                        context: context, message: 'Speaker On');
                  } else {
                    CustomToast().showToastErrorTop(
                        context: context, message: 'Speaker Off');
                  }
                },
              );
            },
          ),
          SizedBox(height: 30.h)
        ],
      ),
    );
  }
}
