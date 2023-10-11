import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:call/Features/Chat/presentation/view/widgets/appbar.dart';
import 'package:call/Features/Chat/presentation/view/widgets/body.dart';
import 'package:call/Features/Contacts/data/models/contact_model.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  final ContactModel contactModel;
  const ChatView({Key? key, required this.contactModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ChatAppBar(
          title: contactModel.name!,
          photoUrl: contactModel.photo!,
          isOnline: contactModel.isOnline!,
          audio: () {
            MyApp.navigation
                .navigateTo(AppRouter.audioCallView, args: contactModel);
          },
          video: () => MyApp.navigation
              .navigateTo(AppRouter.voiceCallView, args: contactModel),
        ),
        body: const ChatBody(),
      ),
    );
  }
}
