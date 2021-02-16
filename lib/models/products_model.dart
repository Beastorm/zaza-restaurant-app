// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
        this.message,
        this.responseCode,
        this.status,
        this.data,
    });

    String message;
    String responseCode;
    bool status;
    List<ProductItem> data;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        message: json["message"] == null ? null : json["message"],
        responseCode: json["response_code"] == null ? null : json["response_code"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : List<ProductItem>.from(json["data"].map((x) => ProductItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "response_code": responseCode == null ? null : responseCode,
        "status": status == null ? null : status,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ProductItem {
    ProductItem({
        this.id,
        this.category,
        this.name,
        this.price,
        this.discount,
        this.type,
        this.description,
        this.image,
        this.status,
        this.date,
        this.updateAt,
    });

    String id;
    String category;
    String name;
    String price;
    String discount;
    String type;
    String description;
    String image;
    String status;
    String date;
    String updateAt;

    factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        id: json["id"] == null ? null : json["id"],
        category: json["category"] == null ? null : json["category"],
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
        discount: json["discount"] == null ? null : json["discount"],
        type: json["type"] == null ? null : json["type"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
        status: json["status"] == null ? null : json["status"],
        date: json["date"] == null ? null : json["date"],
        updateAt: json["update_at"] == null ? null : json["update_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "category": category == null ? null : category,
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "discount": discount == null ? null : discount,
        "type": type == null ? null : type,
        "description": description == null ? null : description,
        "image": image == null ? null : image,
        "status": status == null ? null : status,
        "date": date == null ? null : date,
        "update_at": updateAt == null ? null : updateAt,
    };
}
