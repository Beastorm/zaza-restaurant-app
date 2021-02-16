// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

import 'package:zaza/models/products_model.dart';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.message,
    this.responseCode,
    this.status,
    this.data,
  });

  String message;
  String responseCode;
  bool status;
  Data data;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        message: json["message"] == null ? null : json["message"],
        responseCode:
            json["response_code"] == null ? null : json["response_code"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "response_code": responseCode == null ? null : responseCode,
        "status": status == null ? null : status,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.data,
    this.userDetails,
  });

  List<Datum> data;
  UserDetails userDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        userDetails: json["userDetails"] == null
            ? null
            : UserDetails.fromJson(json["userDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "userDetails": userDetails == null ? null : userDetails.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.qty,
    this.price,
    this.createdAt,
    this.productDetails,
  });

  String id;
  String qty;
  String price;
  String createdAt;
  ProductDetails productDetails;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        qty: json["qty"] == null ? null : json["qty"],
        price: json["price"] == null ? null : json["price"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        productDetails: json["productDetails"] == null
            ? null
            : ProductDetails.fromJson(json["productDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "qty": qty == null ? null : qty,
        "price": price == null ? null : price,
        "created_at": createdAt == null ? null : createdAt,
        "productDetails":
            productDetails == null ? null : productDetails.toJson(),
      };
}

class ProductDetails extends ProductItem {
  ProductDetails({
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

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
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

class UserDetails {
  UserDetails({
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

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
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
