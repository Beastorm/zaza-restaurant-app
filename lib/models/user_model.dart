// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.data,
  });

  List<UserInfo> data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: json["data"] == null
            ? null
            : List<UserInfo>.from(
                json["data"].map((x) => UserInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class UserInfo {
  UserInfo({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.password,
    this.token,
    this.type,
    this.image,
    this.date,
  });

  String id;
  String name;
  String email;
  String mobile;
  String password;
  String token;
  String type;
  String image;
  String date;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        password: json["password"] == null ? null : json["password"],
        token: json["token"] == null ? null : json["token"],
        type: json["type"] == null ? null : json["type"],
        image: json["image"] == null ? null : json["image"],
        date: json["date"] == null ? null : json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "mobile": mobile == null ? null : mobile,
        "password": password == null ? null : password,
        "token": token == null ? null : token,
        "type": type == null ? null : type,
        "image": image == null ? null : image,
        "date": date == null ? null : date,
      };
}
