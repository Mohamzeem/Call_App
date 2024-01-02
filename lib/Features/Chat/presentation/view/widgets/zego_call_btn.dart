import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class ZegoCallButton extends StatelessWidget {
  final String contactId;
  final String contactname;
  final bool isVideoCall;

  const ZegoCallButton({
    super.key,
    required this.contactId,
    required this.contactname,
    required this.isVideoCall,
  });

  @override
  Widget build(BuildContext context) {
    return ZegoSendCallInvitationButton(
      isVideoCall: isVideoCall,
      iconSize: const Size(35, 35),
      buttonSize: const Size(50, 50),
      resourceID:
          "zego_call", //You need to use the resourceID that you created in the subsequent steps. Please continue reading this document.
      invitees: [
        ZegoUIKitUser(
          id: contactId,
          name: contactname,
        ),
      ],
    );
  }
}

// Widget sendCallButton({
//   required bool isVideoCall,
//   required TextEditingController inviteeUsersIDTextCtrl,
//   void Function(String code, String message, List<String>)? onCallFinished,
// }) {
//   return ValueListenableBuilder<TextEditingValue>(
//     valueListenable: inviteeUsersIDTextCtrl,
//     builder: (context, inviteeUserID, _) {
//       final invitees =
//           getInvitesFromTextCtrl(inviteeUsersIDTextCtrl.text.trim());

//       return ZegoSendCallInvitationButton(
//         isVideoCall: isVideoCall,
//         invitees: invitees,
//         resourceID: 'zego_data',
//         iconSize: const Size(40, 40),
//         buttonSize: const Size(50, 50),
//         onPressed: onCallFinished,
//       );
//     },
//   );
// }

// List<ZegoUIKitUser> getInvitesFromTextCtrl(String textCtrlText) {
//   final invitees = <ZegoUIKitUser>[];

//   final inviteeIDs = textCtrlText.trim().replaceAll('，', '');
//   inviteeIDs.split(',').forEach((inviteeUserID) {
//     if (inviteeUserID.isEmpty) {
//       return;
//     }

//     invitees.add(ZegoUIKitUser(
//       id: inviteeUserID,
//       name: 'user_$inviteeUserID',
//     ));
//   });

//   return invitees;
// }
