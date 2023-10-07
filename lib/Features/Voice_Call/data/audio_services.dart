import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceServices {
  final player = AudioPlayer();
  late final RtcEngine engine;
  final ChannelProfileType channelProfileType =
      ChannelProfileType.channelProfileCommunication;

//! initialization RtcEngine
//todo: initialize in the voiceview
  Future<void> initEngine() async {
    //~ set the ringtone
    await player.setAsset('assets/sound/notification.mp3');
    //~ initialize
    engine = createAgoraRtcEngine();
    await engine.initialize(RtcEngineContext(appId: AppStrings.appIdAgora));

    //~ handel events
    engine.registerEventHandler(RtcEngineEventHandler(
      onError: (ErrorCodeType err, String msg) {
        debugPrint('Error: $err,Mg: $msg');
      },
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        debugPrint('JoinChannelSuccess: ${connection.toJson()}');
        //todo: state changed to joined channel
      },
      onUserJoined:
          (RtcConnection connection, int remoteUid, int elapsed) async {
        await player.pause();
        debugPrint('User joined Successfully \n ${connection.toJson()}');
      },
      onLeaveChannel: (RtcConnection connection, RtcStats stats) {
        debugPrint('User left Call \n ${stats.toJson()}');
        //todo: state changed to left channel
      },
      onRtcStats: (RtcConnection connection, RtcStats stats) {
        debugPrint('Time: ${stats.duration}');
      },
    ));

    await engine.enableAudio();
    await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await engine.setAudioProfile(
        profile: AudioProfileType.audioProfileDefault,
        scenario: AudioScenarioType.audioScenarioGameStreaming);

    joinVoiceCall();
  }

//~ join the call
  void joinVoiceCall() async {
    await Permission.microphone.request();
    await engine.joinChannel(
        token:
            '007eJxTYPCcmzfT8tPc+Q/duz2NpV++eV7vVWEy+dRRhsj9HKmVPHEKDCkGqZamyWmWpkmmxibmqcaW5samSUYpiWYphhYWJonGbf6KqQ2BjAz5c/8wMTIwMrAAMYjPBCaZwSQLmGRjyM3PSMwsYmAAAMA4Ik4=',
        channelId: 'mohair',
        uid: 0,
        options: ChannelMediaOptions(
          channelProfile: channelProfileType,
          clientRoleType: ClientRoleType.clientRoleBroadcaster,
        ));
  }

  //~ leave the call
  void leaveVoiceCall() async {
    await engine.leaveChannel();
    await engine.release();
    await player.stop();
  }
}
