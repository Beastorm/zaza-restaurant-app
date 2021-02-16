// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.message,
    this.responseCode,
    this.status,
    this.data,
  });

  String message;
  String responseCode;
  bool status;
  List<CategoryItem> data;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        message: json["message"] == null ? null : json["message"],
        responseCode:
            json["response_code"] == null ? null : json["response_code"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<CategoryItem>.from(
                json["data"].map((x) => CategoryItem.fromJson(x))),
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

class CategoryItem {
  CategoryItem({
    this.id,
    this.parent,
    this.name,
    this.image,
    this.status,
    this.date,
  });

  String id;
  String parent;
  String name;
  String image;
  String status;
  String date;

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        id: json["id"] == null ? null : json["id"],
        parent: json["parent"] == null ? null : json["parent"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        status: json["status"] == null ? null : json["status"],
        date: json["date"] == null ? null : json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "parent": parent == null ? null : parent,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "status": status == null ? null : status,
        "date": date == null ? null : date,
      };
}
