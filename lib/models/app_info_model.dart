// To parse this JSON data, do
//
//     final appInfoModel = appInfoModelFromJson(jsonString);

import 'dart:convert';

AppInfoModel appInfoModelFromJson(String str) => AppInfoModel.fromJson(json.decode(str));

String appInfoModelToJson(AppInfoModel data) => json.encode(data.toJson());

class AppInfoModel {
  AppInfoModel({
    this.message,
    this.responseCode,
    this.status,
    this.data,
  });

  String message;
  String responseCode;
  bool status;
  List<AppInfoData> data;

  factory AppInfoModel.fromJson(Map<String, dynamic> json) => AppInfoModel(
    message: json["message"] == null ? null : json["message"],
    responseCode: json["response_code"] == null ? null : json["response_code"],
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<AppInfoData>.from(json["data"].map((x) => AppInfoData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "response_code": responseCode == null ? null : responseCode,
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AppInfoData {
  AppInfoData({
    this.id,
    this.privacyPolicy,
    this.email,
    this.mobile,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String privacyPolicy;
  String email;
  String mobile;
  DateTime createdAt;
  String updatedAt;

  factory AppInfoData.fromJson(Map<String, dynamic> json) => AppInfoData(
    id: json["id"] == null ? null : json["id"],
    privacyPolicy: json["privacy_policy"] == null ? null : json["privacy_policy"],
    email: json["email"] == null ? null : json["email"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "privacy_policy": privacyPolicy == null ? null : privacyPolicy,
    "email": email == null ? null : email,
    "mobile": mobile == null ? null : mobile,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt,
  };
}
