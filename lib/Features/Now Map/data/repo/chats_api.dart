import 'package:call/Features/Now%20Map/data/models/chats_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsApi {
  final firestore = FirebaseFirestore.instance;
  final String formattedId = '';
  //^ get chats
  Future<List<ChatsModel>> getAllChats() async {
    var result = await firestore
        .collection('Chats')
        .orderBy('createdAt', descending: true)
        .get();
    return result.docs
        .map((value) => ChatsModel.fromJson(value.data()))
        .toList();
  }

  //^ search chat by name
  Future<List<ChatsModel>> searchChatByname({required String name}) async {
    final snapshots = await firestore
        .collection('Chats')
        .where('name', isEqualTo: name)
        .get();
    final data =
        snapshots.docs.map((e) => ChatsModel.fromJson(e.data())).toList();
    // print('Listlength= $data.length');
    // print(data[1].title);
    return data;
  }

  //^ add chats
  addChats() async {
    //var chat = DetailsChatModel(name: 'zemaaaa');
    var model = const ChatsModel(
      id: '01,02,2024, 23:05:38',
      photo:
          'https://firebasestorage.googleapis.com/v0/b/priority-soft-6824e.appspot.com/o/name5.png?alt=media&token=e684851a-aa28-4d27-b5f1-cd35c4c60abd',
      name: 'Eugene Mayer',
      createdAt: '2024-01-01 12:20:03',
      msg: 'The best way to create rich embed messages for your Discord server',
      detailsChat: [],
    );
    await firestore
        .collection('Chats')
        .doc('01,02,2024, 23:05:38')
        .update(model.toJson());
  }
}


//formattedId.dateFormatToString()