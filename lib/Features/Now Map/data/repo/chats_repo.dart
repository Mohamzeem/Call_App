import 'package:call/Features/Now%20Map/data/models/chats_model.dart';
import 'package:dartz/dartz.dart';

abstract class ChatsRepo {
  Future<Either<String, List<ChatsModel>>> getAllChats();
  Future<Either<String, List<ChatsModel>>> searchChatByname(
      {required String name});
}
