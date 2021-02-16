// To parse this JSON data, do
//
//     final productListOfCategory = productListOfCategoryFromJson(jsonString);

import 'dart:convert';

import 'package:zaza/models/products_model.dart';

ProductListOfCategory productListOfCategoryFromJson(String str) =>
    ProductListOfCategory.fromJson(json.decode(str));

String productListOfCategoryToJson(ProductListOfCategory data) =>
    json.encode(data.toJson());

class ProductListOfCategory {
  ProductListOfCategory({
    this.message,
    this.responseCode,
    this.status,
    this.data,
  });

  String message;
  String responseCode;
  bool status;
  List<Datum> data;

  factory ProductListOfCategory.fromJson(Map<String, dynamic> json) =>
      ProductListOfCategory(
        message: json["message"] == null ? null : json["message"],
        responseCode:
            json["response_code"] == null ? null : json["response_code"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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

class Datum {
  Datum({
    this.id,
    this.parent,
    this.name,
    this.image,
    this.status,
    this.date,
    this.listOfProduct,
  });

  String id;
  String parent;
  String name;
  String image;
  String status;
  String date;
  List<ListOfProduct> listOfProduct;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        parent: json["parent"] == null ? null : json["parent"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        status: json["status"] == null ? null : json["status"],
        date: json["date"] == null ? null : json["date"],
        listOfProduct: json["listOfProduct"] == null
            ? null
            : List<ListOfProduct>.from(
                json["listOfProduct"].map((x) => ListOfProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "parent": parent == null ? null : parent,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "status": status == null ? null : status,
        "date": date == null ? null : date,
        "listOfProduct": listOfProduct == null
            ? null
            : List<dynamic>.from(listOfProduct.map((x) => x.toJson())),
      };
}

class ListOfProduct extends ProductItem {
  ListOfProduct({
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

  factory ListOfProduct.fromJson(Map<String, dynamic> json) => ListOfProduct(
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
