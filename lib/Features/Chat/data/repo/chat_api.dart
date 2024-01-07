import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Features/Chat/data/models/msg_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ChatApi {
  final firestore = FirebaseFirestore.instance;
  final String createdAtTime = DateFormat('EEE, MMM d, yyyy, HH:mm:ss aaa')
      .format(DateTime.now())
      .toString();
  final List<String> chatsName = [];
  Future sendMessage(
      {required String receiverId,
      required String receiverName,
      required String msg}) async {
    final message = MessageModel(
      senderId: MyApp.currentUser!.id!,
      senderName: MyApp.currentUser!.name!,
      receiverId: receiverId,
      receiverName: receiverName,
      message: msg,
      createdAt: createdAtTime,
      id: createdAtTime,
    );
    List<String> ids = [MyApp.currentUser!.id!, receiverId];
    ids.sort();
    String chatRoomId = ids.join("-");
    await firestore
        .collection(AppStrings.chatCollection)
        .doc(chatRoomId)
        .collection("Messages")
        .add(message.toMap());
  }

  Stream<List<MessageModel>> getMessages({
    required String userId,
    required String receiverId,
  }) {
    List<String> ids = [MyApp.currentUser!.id!, receiverId];
    ids.sort();
    String chatRoomId = ids.join("-");

    return firestore
        .collection(AppStrings.chatCollection)
        .doc(chatRoomId)
        .collection("Messages")
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((value) {
      return value.docs.map((e) {
        final data = e.data();
        return MessageModel(
          senderId: data['senderId'],
          senderName: data['senderName'],
          receiverId: data['receiverId'],
          receiverName: data['receiverName'],
          message: data['message'],
          createdAt: data['createdAt'],
          id: data['id'],
        );
      }).toList();
    });
  }
}
