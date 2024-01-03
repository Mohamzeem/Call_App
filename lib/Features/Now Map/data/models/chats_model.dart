import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Features/Now%20Map/data/models/details_chat_model.dart';
import 'package:equatable/equatable.dart';

class ChatsModel extends Equatable {
  final String? id;
  final String? photo;
  final String? name;
  final String? createdAt;
  final String? msg;
  final List<DetailsChatModel> detailsChat;
  const ChatsModel({
    this.id,
    this.photo,
    this.name,
    this.createdAt,
    this.msg,
    required this.detailsChat,
  });

  factory ChatsModel.fromJson(Map<String, dynamic> json) {
    List<DetailsChatModel> chats = [];
    if (json['chats'] != null) {
      var reviewsList = json['chats'] as List<dynamic>;
      chats =
          reviewsList.map((chat) => DetailsChatModel.fromJson(chat)).toList();
    }
    return ChatsModel(
        id: json['id'] ?? "",
        photo: json['photo'] ?? "",
        name: json['name'] ?? "",
        createdAt: json['createdAt'] ?? "",
        msg: json['msg'] ?? "",
        detailsChat: chats);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'photo': photo ?? "",
      'name': name ?? "",
      'createdAt': createdAt ?? "",
      'msg': msg ?? "",
    };
  }

  String get isPhoto {
    if (photo!.isEmpty) {
      return AppStrings.defaultAppPhoto;
    }
    return photo!;
  }

  @override
  List<Object?> get props => [id, photo, name, msg, createdAt];
}

// {String? id, String? tokenFcm, bool? isloged, bool? isOnline}