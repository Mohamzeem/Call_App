part of 'chats_cubit.dart';

sealed class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

final class ChatsInitialState extends ChatsState {}

//^ get all chats
final class GetChatsLoadingState extends ChatsState {}

final class GetChatsSuccessfullState extends ChatsState {
  final List<ChatsModel> allChats;
  const GetChatsSuccessfullState({required this.allChats});
  @override
  List<Object> get props => [allChats];
}

final class GetChatsFailureState extends ChatsState {
  final String failMsg;
  const GetChatsFailureState({required this.failMsg});
  @override
  List<Object> get props => [failMsg];
}

final class GetChatsEmptyState extends ChatsState {
  final String emptyMsg;
  const GetChatsEmptyState({required this.emptyMsg});
  @override
  List<Object> get props => [emptyMsg];
}

//^ search chat by name

final class SearchChatSuccessfullState extends ChatsState {
  final List<ChatsModel> searchedList;
  const SearchChatSuccessfullState({required this.searchedList});
  @override
  List<Object> get props => [searchedList];
}

final class SearchChatLoadingState extends ChatsState {}

final class SearchChatFailureState extends ChatsState {
  final String failMsg;
  const SearchChatFailureState({required this.failMsg});
  @override
  List<Object> get props => [failMsg];
}

final class SearchChatEmptyState extends ChatsState {
  final String emptyMsg;
  const SearchChatEmptyState({required this.emptyMsg});
  @override
  List<Object> get props => [emptyMsg];
}
