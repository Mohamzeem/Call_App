import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:call/Core/Services/prints/prints_service.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';

part 'voice_call_state.dart';

class VoiceCallCubit extends Cubit<VoiceCallState> {
  VoiceCallCubit() : super(const VoiceCallInitialState());

  bool isCalling = true;
  bool micOn = true;
  bool speakerOn = false;

  void editIsCalling() {
    isCalling = !isCalling;
    emit(VoiceCallCallingState(isCalling: isCalling));
  }

  void editMicOn() {
    micOn = !micOn;
    emit(VoiceCallMicOnState(micOn: micOn));
  }

  void editSpeakerOn() {
    speakerOn = !speakerOn;
    emit(VoiceCallSpeakerOnState(speakerOn: speakerOn));
  }

  final player = AudioPlayer();
  late final RtcEngine engine;
  final ChannelProfileType channelProfileType =
      ChannelProfileType.channelProfileCommunication;

//~ initialize RtcEngine in the voiceview
  Future<void> initEngine() async {
    //~ set the ringtone
    await player.setAsset('assets/sound/notification.mp3');

    //~ initialize
    engine = createAgoraRtcEngine();
    await engine.initialize(RtcEngineContext(appId: AppStrings.agoraAppId));
    Prints.success(message: '### RTC ENGINE Initialized', endPoint: '');
    //~ handel events
    engine.registerEventHandler(RtcEngineEventHandler(
      onError: (ErrorCodeType err, String msg) {
        debugPrint('Error: $err,Mg: $msg');
      },
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        Prints.success(
            message:
                '### JoinChannelSuccess: ${connection.toJson()} + ### $isCalling',
            endPoint: '');
        //! state changed to joined channel
        emit(const VoiceCallCallingState(isCalling: false));
        isCalling = false;
        Prints.debug(message: '### IsCallingState: $isCalling');
      },
      onUserJoined:
          (RtcConnection connection, int remoteUid, int elapsed) async {
        await player.pause();
        Prints.success(
            message: '### UserjoinedSuccessfully: ${connection.toJson()}',
            endPoint: '');
      },
      onLeaveChannel: (RtcConnection connection, RtcStats stats) {
        Prints.error(
            message: '### UserleftCall: ${stats.toJson()}', endPoint: '');
        //! state changed to left channel
        emit(const VoiceCallCallingState(isCalling: false));
      },
      onRtcStats: (RtcConnection connection, RtcStats stats) {
        Prints.debug(message: '### Time: ${stats.duration}');
      },
    ));

    await engine.enableAudio();
    await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await engine.setAudioProfile(
        profile: AudioProfileType.audioProfileDefault,
        scenario: AudioScenarioType.audioScenarioGameStreaming);

    await joinVoiceCall();
  }

//~ join the call
  joinVoiceCall() async {
    await Permission.microphone.request();
    await engine.joinChannel(
        token:
            '007eJxTYFj06brbfU7TSwWMS0VWrVCNXbll3lre++c2tfiL3rsh3yilwJBikGppmpxmaZpkamxinmpsaW5smmSUkmiWYmhhYZJoXLlYKbUhkJHh7lxORkYGRgYWIAbxmcAkM5hkAZOsDInFKYkpDAwA03wiPQ==',
        channelId: 'asdad',
        uid: 0,
        options: ChannelMediaOptions(
          channelProfile: channelProfileType,
          clientRoleType: ClientRoleType.clientRoleBroadcaster,
        ));
    Prints.success(message: '### Joined Voice Call Successfully', endPoint: '');
  }

  //~ leave the call
  leaveVoiceCall() async {
    await player.pause();
    await engine.leaveChannel();
    await engine.release();
    await player.stop();
    Prints.error(message: '### RTC ENGINE STOPPED', endPoint: '');
  }
}
