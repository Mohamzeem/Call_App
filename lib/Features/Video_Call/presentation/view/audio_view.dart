import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:flutter/material.dart';

class VideoCallView extends StatelessWidget {
  final UserModel userModel;
  const VideoCallView({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          isArrowBack: true,
          isProfile: true,
          title: 'Video Calling ${userModel.name}',
        ),
      ),
    );
  }
}
