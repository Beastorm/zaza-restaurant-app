// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

ContactModel contactModelFromJson(String str) =>
    ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
  ContactModel({
    this.message,
    this.responseCode,
    this.status,
    this.data,
  });

  String message;
  String responseCode;
  bool status;
  List<ContactData> data;

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        message: json["message"] == null ? null : json["message"],
        responseCode:
            json["response_code"] == null ? null : json["response_code"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<ContactData>.from(
                json["data"].map((x) => ContactData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "response_code": responseCode == null ? null : responseCode,
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ContactData {
  ContactData({
    this.id,
    this.name,
    this.createdAt,
    this.contactEmail,
    this.contactMobile,
    this.termsAndConditions,
  });

  String id;
  String name;
  DateTime createdAt;
  String contactEmail;
  String contactMobile;
  String termsAndConditions;

  factory ContactData.fromJson(Map<String, dynamic> json) => ContactData(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        contactEmail:
            json["contact_email"] == null ? null : json["contact_email"],
        contactMobile:
            json["contact_mobile"] == null ? null : json["contact_mobile"],
        termsAndConditions: json["terms_and_conditions"] == null
            ? null
            : json["terms_and_conditions"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "contact_email": contactEmail == null ? null : contactEmail,
        "contact_mobile": contactMobile == null ? null : contactMobile,
        "terms_and_conditions":
            termsAndConditions == null ? null : termsAndConditions,
      };
}
