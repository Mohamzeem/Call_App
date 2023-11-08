// Package imports:
import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

// Project imports:
import 'avatar_build.dart';

ZegoUIKitPrebuiltCallController? callController;

/// local virtual login
// Future<void> login({
//   required String userID,
//   required String userName,
// }) async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setString(cacheUserIDKey, userID);

//   currentUser.id = userID;
//   currentUser.name = 'user_$userID';
// }

/// local virtual logout
// Future<void> logout() async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.remove(cacheUserIDKey);
// }

/// on user login
// void onUserLogin() {
//   callController ??= ZegoUIKitPrebuiltCallController();

//   /// 4/5. initialized ZegoUIKitPrebuiltCallInvitationService when account is logged in or re-logged in
//   ZegoUIKitPrebuiltCallInvitationService().init(
//     appID: AppStrings.zegoAppID /*input your AppID*/,
//     appSign: AppStrings.zegoAppSign /*input your AppSign*/,
//     userID: MyApp.currentUser.id!,
//     userName: MyApp.currentUser.name!,
//     notifyWhenAppRunningInBackgroundOrQuit: false,
//     plugins: [ZegoUIKitSignalingPlugin()],
//     controller: callController,
//     requireConfig: (ZegoCallInvitationData data) {
//       final config = (data.invitees.length > 1)
//           ? ZegoCallType.videoCall == data.type
//               ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
//               : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
//           : ZegoCallType.videoCall == data.type
//               ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
//               : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

//       config.avatarBuilder = avatarBuilder;

//       /// support minimizing, show minimizing button
//       config.topMenuBarConfig.isVisible = true;
//       config.topMenuBarConfig.buttons
//           .insert(0, ZegoMenuBarButtonName.minimizingButton);

//       return config;
//     },
//   );
// }

/// on user logout
void onUserLogout() {
  callController = null;

  /// 5/5. de-initialization ZegoUIKitPrebuiltCallInvitationService when account is logged out
  ZegoUIKitPrebuiltCallInvitationService().uninit();
}
