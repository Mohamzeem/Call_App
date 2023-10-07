import 'package:call/Features/Audio_Call/presentation/view/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Features/Register/data/models/user_model.dart';

class VoiceCallView extends StatelessWidget {
  final UserModel userModel;
  const VoiceCallView({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          isArrowBack: true,
          isProfile: true,
          //    title: 'Audio Calling ${userModel.name}',
        ),
        body: VoiceCallBody(
          photoUrl: userModel.photo!,
          name: userModel.name!,
        ),
      ),
    );
  }
}
