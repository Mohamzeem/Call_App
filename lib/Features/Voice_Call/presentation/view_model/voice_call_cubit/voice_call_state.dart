part of 'voice_call_cubit.dart';

sealed class VoiceCallState extends Equatable {
  const VoiceCallState();

  @override
  List<Object> get props => [];
}

final class VoiceCallInitialState extends VoiceCallState {
  const VoiceCallInitialState();
}

final class VoiceCallCallingState extends VoiceCallState {
  final bool isCalling;
  const VoiceCallCallingState({required this.isCalling});
  @override
  List<Object> get props => [isCalling];
}

final class VoiceCallMicOnState extends VoiceCallState {
  final bool micOn;
  const VoiceCallMicOnState({required this.micOn});
  @override
  List<Object> get props => [micOn];
}

final class VoiceCallSpeakerOnState extends VoiceCallState {
  final bool speakerOn;
  const VoiceCallSpeakerOnState({required this.speakerOn});
  @override
  List<Object> get props => [speakerOn];
}
