// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:walturn/domain/entities/user_entity.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends UserEntity {
  UserModel({
    required this.user,
    required this.token,
  }) : super(token);

  final User user;
  final String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    this.age,
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  final int? age;
  final String? id;
  final String? name;
  final String? email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        age: json["age"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "_id": id,
        "name": name,
        "email": email,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
