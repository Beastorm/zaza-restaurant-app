// To parse this JSON data, do
//
//     final userAccountModel = userAccountModelFromJson(jsonString);

import 'dart:convert';

UserAccountModel userAccountModelFromJson(String str) =>
    UserAccountModel.fromJson(json.decode(str));

String userAccountModelToJson(UserAccountModel data) =>
    json.encode(data.toJson());

class UserAccountModel {
  UserAccountModel({
    this.message,
    this.responseCode,
    this.status,
    this.data,
  });

  String message;
  String responseCode;
  bool status;
  UserData data;

  factory UserAccountModel.fromJson(Map<String, dynamic> json) =>
      UserAccountModel(
        message: json["message"] == null ? null : json["message"],
        responseCode:
            json["response_code"] == null ? null : json["response_code"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "response_code": responseCode == null ? null : responseCode,
        "status": status == null ? null : status,
        "data": data == null ? null : data.toJson(),
      };
}

class UserData {
  UserData({
    this.personal,
    this.address,
  });

  Personal personal;
  List<Address> address;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        personal: json["personal"] == null
            ? null
            : Personal.fromJson(json["personal"]),
        address: json["address"] == null
            ? null
            : List<Address>.from(
                json["address"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "personal": personal == null ? null : personal.toJson(),
        "address": address == null
            ? null
            : List<dynamic>.from(address.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    this.id,
    this.user,
    this.address,
    this.pin,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String user;
  String address;
  String pin;
  String createdAt;
  String updatedAt;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"] == null ? null : json["id"],
        user: json["user"] == null ? null : json["user"],
        address: json["address"] == null ? null : json["address"],
        pin: json["pin"] == null ? null : json["pin"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user": user == null ? null : user,
        "address": address == null ? null : address,
        "pin": pin == null ? null : pin,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
      };
}

class Personal {
  Personal({
    this.name,
    this.mobile,
    this.email,
    this.type,
    this.image,
  });

  String name;
  String mobile;
  String email;
  String type;
  String image;

  factory Personal.fromJson(Map<String, dynamic> json) => Personal(
        name: json["name"] == null ? null : json["name"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        email: json["email"] == null ? null : json["email"],
        type: json["type"] == null ? null : json["type"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "mobile": mobile == null ? null : mobile,
        "email": email == null ? null : email,
        "type": type == null ? null : type,
        "image": image == null ? null : image,
      };
}
