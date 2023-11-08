import 'package:call/Core/Utils/app_strings.dart';
import 'package:equatable/equatable.dart';

class ContactModel extends Equatable {
  final String? id;
  final String? photo;
  final String? name;
  final String? tokenFcm;
  final bool? isOnline;
  const ContactModel({
    this.id,
    this.photo,
    this.name,
    this.tokenFcm,
    this.isOnline,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'] ?? "",
      photo: json['photo'] ?? "",
      name: json['name'] ?? "",
      tokenFcm: json['tokenFcm'] ?? "",
      isOnline: json['isOnline'] ?? false,
    );
  }

  Map<String, dynamic> toJson(
      {String? id, String? tokenFcm, bool? isloged, bool? isOnline}) {
    return <String, dynamic>{
      'id': id,
      'photo': photo ?? "",
      'name': name ?? "",
      'tokenFcm': tokenFcm,
      'isOnline': isOnline,
    };
  }

  String get isPhoto {
    if (photo!.isEmpty) {
      return AppStrings.defaultAppPhoto;
    }
    return photo!;
  }

  @override
  List<Object?> get props => [
        id,
        photo,
        name,
        tokenFcm,
      ];
}
