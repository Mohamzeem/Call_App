import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  final String? senderId;
  final String? senderName;
  final String? receiverId;
  final String? receiverName;
  final String? createdAt;
  final String? id;
  const ChatModel({
    this.senderId,
    this.senderName,
    this.receiverId,
    this.receiverName,
    this.createdAt,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'senderName': senderName,
      'receiverId': receiverId,
      'receiverName': receiverName,
      'createdAt': createdAt,
      'id': id,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      senderId: map['senderId'] != null ? map['senderId'] as String : null,
      senderName:
          map['senderName'] != null ? map['senderName'] as String : null,
      receiverId:
          map['receiverId'] != null ? map['receiverId'] as String : null,
      receiverName:
          map['receiverName'] != null ? map['receiverName'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }
  @override
  List<Object> get props {
    return [
      senderId!,
      senderName!,
      receiverId!,
      receiverName!,
      createdAt!,
      id!,
    ];
  }
}
