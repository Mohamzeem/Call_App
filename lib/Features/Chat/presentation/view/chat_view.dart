import 'package:call/Features/Chat/presentation/view/widgets/appbar.dart';
import 'package:call/Features/Chat/presentation/view/widgets/body.dart';
import 'package:call/Features/Chat/presentation/view/widgets/zego_call_btn.dart';
import 'package:call/Features/Contacts/data/models/contact_model.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  final ContactModel contactModel;
  const ChatView({Key? key, required this.contactModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: ChatAppBar(
          title: contactModel.name!,
          photoUrl: contactModel.photo!,
          isOnline: contactModel.isOnline!,
          audio: ZegoCallButton(
            contactId: contactModel.id!,
            contactname: contactModel.name!,
            isVideoCall: false,
          ),
          //  () => MyApp.navigation
          //     .navigateTo(AppRouter.audioCallView, args: contactModel),
          video: ZegoCallButton(
            contactId: contactModel.id!,
            contactname: contactModel.name!,
            isVideoCall: true,
          ),
          // () => MyApp.navigation
          //     .navigateTo(AppRouter.voiceCallView, args: contactModel),
        ),
      ),
      body: ChatBody(model: contactModel),
    );
  }
}
