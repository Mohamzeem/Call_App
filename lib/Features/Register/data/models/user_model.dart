import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String? photo;
  final String? name;
  final String? email;
  final String? mobileNum;
  final String? tokenFcm;
  final bool? isLoged;

  const UserModel({
    this.id,
    this.photo,
    this.name,
    this.email,
    this.mobileNum,
    this.tokenFcm,
    this.isLoged,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      photo: json['photo'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      mobileNum: json['mobileNum'] ?? '',
      tokenFcm: json['tokenFcm'] ?? '',
      isLoged: json['isLoged'] ?? false,
    );
  }

  Map<String, dynamic> toJson({required String id, required String tokenFcm}) {
    return <String, dynamic>{
      'id': id,
      'photo': photo ?? "",
      'name': name ?? "",
      'email': email ?? "",
      'mobileNum': mobileNum ?? "",
      'tokenFcm': tokenFcm,
      'isLoged': true,
    };
  }

  Map<String, dynamic> toUpdateJson({
    required String photo,
    required String name,
    required String mobileNum,
    required String tokenFcm,
  }) {
    return <String, dynamic>{
      'photo': photo,
      'name': name,
      'mobileNum': mobileNum,
      'tokenFcm': tokenFcm,
    };
  }

  String get isPhoto {
    if (photo!.isEmpty) {
      return '';
    }
    return photo!;
  }

  @override
  List<Object?> get props =>
      [id, photo, name, email, mobileNum, tokenFcm, isLoged];
}
