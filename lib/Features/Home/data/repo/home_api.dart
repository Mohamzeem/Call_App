import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Features/Chat/data/models/msg_model.dart';
import 'package:call/Features/Home/data/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeApi {
  final firestore = FirebaseFirestore.instance;

  //^get chats
  Stream<List<ChatModel>> getChats() {
    return firestore
        .collection(AppStrings.chatCollection)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((value) {
      return value.docs.map((e) {
        final data = e.data();
        return ChatModel(
          senderId: data['senderId'],
          senderName: data['senderName'],
          receiverId: data['receiverId'],
          receiverName: data['receiverName'],
          createdAt: data['createdAt'],
          id: data['id'],
        );
      }).toList();
    });
  }
}
