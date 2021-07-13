// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'package:zaza/models/products_model.dart';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
    OrderModel({
        this.message,
        this.responseCode,
        this.status,
        this.data,
    });

    String message;
    String responseCode;
    bool status;
    List<OrderData> data;

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        message: json["message"] == null ? null : json["message"],
        responseCode: json["response_code"] == null ? null : json["response_code"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : List<OrderData>.from(json["data"].map((x) => OrderData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "response_code": responseCode == null ? null : responseCode,
        "status": status == null ? null : status,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class OrderData {
    OrderData({
        this.id,
        this.orderId,
        this.qty,
        this.notes,
        this.amount,
        this.paymentMethod,
        this.paymentBy,
        this.transactionId,
        this.status,
        this.orderType,
        this.deliveryboy,
        this.deliveryStatus,
        this.shippingAddress,
        this.pincode,
        this.orderDate,
        this.productDetails,
        this.userDetails,
    });

    String id;
    String orderId;
    String qty;
    String notes;
    String amount;
    String paymentMethod;
    String paymentBy;
    String transactionId;
    String status;
    String orderType;
    String deliveryboy;
    String deliveryStatus;
    String shippingAddress;
    String pincode;
    DateTime orderDate;
    List<ProductItem> productDetails;
    UserDetails userDetails;

    factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json["id"] == null ? null : json["id"],
        orderId: json["order_id"] == null ? null : json["order_id"],
        qty: json["qty"] == null ? null : json["qty"],
        notes: json["notes"] == null ? null : json["notes"],
        amount: json["amount"] == null ? null : json["amount"],
        paymentMethod: json["payment_method"] == null ? null : json["payment_method"],
        paymentBy: json["payment_by"] == null ? null : json["payment_by"],
        transactionId: json["transaction_id"] == null ? null : json["transaction_id"],
        status: json["status"] == null ? null : json["status"],
        orderType: json["order_type"] == null ? null : json["order_type"],
        deliveryboy: json["deliveryboy"] == null ? null : json["deliveryboy"],
        deliveryStatus: json["delivery_status"] == null ? null : json["delivery_status"],
        shippingAddress: json["shipping_address"] == null ? null : json["shipping_address"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
        productDetails: json["product_details"] == null ? null : List<ProductItem>.from(json["product_details"].map((x) => ProductItem.fromJson(x))),
        userDetails: json["user_details"] == null ? null : UserDetails.fromJson(json["user_details"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "order_id": orderId == null ? null : orderId,
        "qty": qty == null ? null : qty,
        "notes": notes == null ? null : notes,
        "amount": amount == null ? null : amount,
        "payment_method": paymentMethod == null ? null : paymentMethod,
        "payment_by": paymentBy == null ? null : paymentBy,
        "transaction_id": transactionId == null ? null : transactionId,
        "status": status == null ? null : status,
        "order_type": orderType == null ? null : orderType,
        "deliveryboy": deliveryboy == null ? null : deliveryboy,
        "delivery_status": deliveryStatus == null ? null : deliveryStatus,
        "shipping_address": shippingAddress == null ? null : shippingAddress,
        "pincode": pincode == null ? null : pincode,
        "order_date": orderDate == null ? null : orderDate.toIso8601String(),
        "product_details": productDetails == null ? null : List<dynamic>.from(productDetails.map((x) => x.toJson())),
        "user_details": userDetails == null ? null : userDetails.toJson(),
    };
}

class ProductDetail {
    ProductDetail({
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
    DateTime date;
    DateTime updateAt;

    factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"] == null ? null : json["id"],
        category: json["category"] == null ? null : json["category"],
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
        discount: json["discount"] == null ? null : json["discount"],
        type: json["type"] == null ? null : json["type"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
        status: json["status"] == null ? null : json["status"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        updateAt: json["update_at"] == null ? null : DateTime.parse(json["update_at"]),
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
        "date": date == null ? null : date.toIso8601String(),
        "update_at": updateAt == null ? null : updateAt.toIso8601String(),
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
    DateTime date;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        password: json["password"] == null ? null : json["password"],
        token: json["token"] == null ? null : json["token"],
        type: json["type"] == null ? null : json["type"],
        image: json["image"] == null ? null : json["image"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
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
        "date": date == null ? null : date.toIso8601String(),
    };
}
