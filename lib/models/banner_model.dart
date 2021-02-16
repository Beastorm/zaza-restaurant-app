// To parse this JSON data, do
//
//     final banner = bannerFromJson(jsonString);

import 'dart:convert';

Banner bannerFromJson(String str) => Banner.fromJson(json.decode(str));

String bannerToJson(Banner data) => json.encode(data.toJson());

class Banner {
  Banner({
    this.message,
    this.responseCode,
    this.status,
    this.data,
  });

  String message;
  String responseCode;
  bool status;
  List<BannerItem> data;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        message: json["message"] == null ? null : json["message"],
        responseCode:
            json["response_code"] == null ? null : json["response_code"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<BannerItem>.from(json["data"].map((x) => BannerItem.fromJson(x))),
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

class BannerItem {
  BannerItem({
    this.id,
    this.image,
    this.date,
  });

  String id;
  String image;
  String date;

  factory BannerItem.fromJson(Map<String, dynamic> json) => BannerItem(
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
        date: json["date"] == null ? null : json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "image": image == null ? null : image,
        "date": date == null ? null : date,
      };
}
