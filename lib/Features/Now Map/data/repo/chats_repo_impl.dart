import 'package:call/Features/Now%20Map/data/models/chats_model.dart';
import 'package:call/Features/Now%20Map/data/repo/chats_api.dart';
import 'package:call/Features/Now%20Map/data/repo/chats_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class ChatsRepoImpl extends ChatsRepo {
  final ChatsApi api;
  ChatsRepoImpl({
    required this.api,
  });
  @override
  Future<Either<String, List<ChatsModel>>> getAllChats() async {
    try {
      final result = await api.getAllChats();
      return right(result);
    } on FirebaseException catch (e) {
      return left(e.code.toString());
    }
  }

  @override
  Future<Either<String, List<ChatsModel>>> searchChatByname(
      {required String name}) async {
    try {
      final result = await api.searchChatByname(name: name);
      return right(result);
    } on FirebaseException catch (e) {
      return left(e.code.toString());
    }
  }
}
