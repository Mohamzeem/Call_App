import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String? senderId;
  final String? senderName;
  final String? receiverId;
  final String? receiverName;
  final String? message;
  final String? createdAt;
  final String? id;
  const MessageModel({
    this.senderId,
    this.senderName,
    this.receiverId,
    this.receiverName,
    this.message,
    this.createdAt,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'senderName': senderName,
      'receiverId': receiverId,
      'receiverName': receiverName,
      'message': message,
      'createdAt': createdAt,
      'id': id,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'] != null ? map['senderId'] as String : null,
      senderName:
          map['senderName'] != null ? map['senderName'] as String : null,
      receiverId:
          map['receiverId'] != null ? map['receiverId'] as String : null,
      receiverName:
          map['receiverName'] != null ? map['receiverName'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
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
      message!,
      createdAt!,
      id!,
    ];
  }
}
