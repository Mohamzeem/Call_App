import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Services/zego_services/avatar_build.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class ZegoServices {
  ZegoUIKitPrebuiltCallController? callController;

  //~ init zego service
  Future initZego() async {
    // callController ??= ZegoUIKitPrebuiltCallController();

    ZegoUIKitPrebuiltCallInvitationService().init(
      appID: AppStrings.zegoAppID,
      appSign: AppStrings.zegoAppSign,
      userID: MyApp.currentUser!.id!,
      userName: MyApp.currentUser!.name!,
      notifyWhenAppRunningInBackgroundOrQuit: false,
      controller: callController,
      plugins: [ZegoUIKitSignalingPlugin()],
      requireConfig: (ZegoCallInvitationData data) {
        final config = (data.invitees.length > 1)
            ? ZegoCallType.videoCall == data.type
                ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
                : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
            : ZegoCallType.videoCall == data.type
                ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
                : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();
        config.avatarBuilder = avatarBuilder;

        /// support minimizing, show minimizing button
        config.topMenuBarConfig.isVisible = true;
        config.topMenuBarConfig.buttons
            .insert(0, ZegoMenuBarButtonName.minimizingButton);
        return config;
      },
    );
  }

//* close zego service
  Future closeZego() async {
    callController = null;
    await ZegoUIKitPrebuiltCallInvitationService().uninit();
  }
}
