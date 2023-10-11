import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:call/Features/Contacts/data/models/contact_model.dart';
import 'package:call/Features/Video_Call/presentation/view/widgets/body.dart';
import 'package:flutter/material.dart';

class VideoCallView extends StatelessWidget {
  final ContactModel contactModel;
  const VideoCallView({Key? key, required this.contactModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          isArrowBack: true,
          isProfile: true,
          //  title: 'Video Calling ${contactModel.name}',
        ),
        body: VideoCallBody(
          photoUrl: contactModel.photo!,
          name: contactModel.name!,
        ),
      ),
    );
  }
}
