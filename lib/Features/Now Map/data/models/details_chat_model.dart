import 'package:call/Core/Utils/app_strings.dart';
import 'package:equatable/equatable.dart';

class DetailsChatModel extends Equatable {
  final String? id;
  final String? name;
  final String? photo;
  final String? msg;
  final String? createdAt;

  const DetailsChatModel({
    this.id,
    this.name,
    this.photo,
    this.msg,
    this.createdAt,
  });

  factory DetailsChatModel.fromJson(Map<String, dynamic> json) {
    return DetailsChatModel(
      name: json['name'] ?? "",
      photo: json['photo'] ?? "",
      msg: json['msg'] ?? "",
      id: json['id'] ?? "",
      createdAt: json['createdAt'] ?? "",
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id ?? "",
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
  List<Object> get props => [name!, photo!, msg!, id!, createdAt!];
}
