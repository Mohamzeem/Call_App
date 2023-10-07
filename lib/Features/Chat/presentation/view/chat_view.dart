import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/routes/app_routes.dart';
import 'package:call/Features/Chat/presentation/view/widgets/appbar.dart';
import 'package:call/Features/Chat/presentation/view/widgets/body.dart';
import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  final UserModel userModel;
  const ChatView({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ChatAppBar(
          title: userModel.name!,
          photoUrl: userModel.photo!,
          isOnline: userModel.isOnline!,
          audio: () {
            MyApp.navigation
                .navigateTo(AppRouter.audioCallView, args: userModel);
          },
          video: () => MyApp.navigation
              .navigateTo(AppRouter.voiceCallView, args: userModel),
        ),
        body: const ChatBody(),
      ),
    );
  }
}
