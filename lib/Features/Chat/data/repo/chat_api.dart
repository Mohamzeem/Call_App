import 'package:call/Core/App/app_info.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Features/Chat/data/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ChatApi {
  final firestore = FirebaseFirestore.instance;
  final String createdAtTime = DateFormat('EEE, MMM d, yyyy, HH:mm:ss aaa')
      .format(DateTime.now())
      .toString();
  final List<String> chatsName = [];
  Future sendChatMessage(
      {required String receiverId,
      required String receiverName,
      required String msg}) async {
    final message = ChatModel(
      senderId: MyApp.currentUser!.id!,
      senderName: MyApp.currentUser!.name!,
      receiverId: receiverId,
      receiverName: receiverName,
      message: msg,
      createdAt: createdAtTime,
      id: createdAtTime,
    );
    await firestore
        .collection(AppStrings.chatCollection)
        .doc(MyApp.currentUser!.id!)
        .collection(receiverId)
        .doc(createdAtTime)
        .set(message.toMap());
  }

//   Future getAllChats({
//     required String receiverId,
//   }) async {
//     final result = await firestore
//         .collection(AppStrings.chatCollection)
//         .doc(MyApp.currentUser!.id!)
//         .get();

// for (var element in result) {

// }  }
}
