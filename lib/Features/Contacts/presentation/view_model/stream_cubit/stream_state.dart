part of 'stream_cubit.dart';

sealed class StreamState extends Equatable {
  const StreamState();

  @override
  List<Object> get props => [];
}

final class StreamInitialState extends StreamState {}

final class StreamLoadingState extends StreamState {
  const StreamLoadingState();
}

final class StreamEmptyState extends StreamState {
  const StreamEmptyState();
}

final class StreamSuccessState extends StreamState {
  final List<UserModel> streamList;
  const StreamSuccessState({required this.streamList});
  @override
  List<Object> get props => [streamList];
}

final class StreamFailureState extends StreamState {
  final String errMsg;
  const StreamFailureState({required this.errMsg});
  @override
  List<Object> get props => [errMsg];
}
