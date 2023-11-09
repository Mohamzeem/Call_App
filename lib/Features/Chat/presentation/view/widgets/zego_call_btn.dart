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
