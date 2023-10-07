part of 'voice_call_cubit.dart';

sealed class VoiceCallState extends Equatable {
  const VoiceCallState();

  @override
  List<Object> get props => [];
}

final class VoiceCallInitialState extends VoiceCallState {
  const VoiceCallInitialState();
}

final class VoiceCallCalling extends VoiceCallState {
  final bool isCalling;
  const VoiceCallCalling({required this.isCalling});
  @override
  List<Object> get props => [isCalling];
}
