// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:call/Features/Now%20Map/data/models/chats_model.dart';
import 'package:call/Features/Now%20Map/data/repo/chats_repo_impl.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  final ChatsRepoImpl repoImpl;
  List<ChatsModel> listOfChats = [];
  ChatsCubit({required this.repoImpl}) : super(ChatsInitialState());
  Future<void> getChats() async {
    emit(GetChatsLoadingState());
    final result = await repoImpl.getAllChats();
    result.fold((failure) => emit(GetChatsFailureState(failMsg: failure)),
        (chats) {
      if (chats.isEmpty) {
        emit(const GetChatsEmptyState(emptyMsg: 'No chats were found'));
        return;
      }
      listOfChats = chats;
      emit(GetChatsSuccessfullState(allChats: chats));
    });
  }

  void searchChatByname(String searchName) {
    var searchResult = listOfChats
        .where((e) =>
            e.name!.toLowerCase().startsWith(searchName.toLowerCase().trim()))
        .toList();

    if (searchResult.isEmpty) {
      emit(const SearchChatEmptyState(emptyMsg: 'No Name found'));
      return;
    }

    emit(SearchChatSuccessfullState(searchedList: searchResult));
  }

  // Future<void> searchChatByname({required String name}) async {
  //   emit(SearchChatLoadingState());
  //   final result = await repoImpl.searchChatByname(name: name);
  //   result.fold((failure) => emit(SearchChatFailureState(failMsg: failure)),
  //       (searchedList) {
  //     if (searchedList.isEmpty) {
  //       emit(const SearchChatEmptyState(emptyMsg: 'No Name found'));
  //       return;
  //     }
  //     emit(SearchChatSuccessfullState(searchedList: searchedList));
  //   });
  // }
}
