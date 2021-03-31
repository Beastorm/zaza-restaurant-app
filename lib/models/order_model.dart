// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'products_model.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

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
        responseCode:
            json["response_code"] == null ? null : json["response_code"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<OrderData>.from(
                json["data"].map((x) => OrderData.fromJson(x))),
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

class OrderData {
  OrderData({
    this.id,
    this.orderId,
    this.user,
    this.product,
    this.qty,
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
  });

  String id;
  String orderId;
  String user;
  List<ProductItem> product;
  String qty;
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

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json["id"] == null ? null : json["id"],
        orderId: json["order_id"] == null ? null : json["order_id"],
        user: json["user"] == null ? null : json["user"],
        product: json["product"] == null
            ? null
            : List<ProductItem>.from(
                json["product"].map((x) => ProductItem.fromJson(x))),
        qty: json["qty"] == null ? null : json["qty"],
        amount: json["amount"] == null ? null : json["amount"],
        paymentMethod:
            json["payment_method"] == null ? null : json["payment_method"],
        paymentBy: json["payment_by"] == null ? null : json["payment_by"],
        transactionId:
            json["transaction_id"] == null ? null : json["transaction_id"],
        status: json["status"] == null ? null : json["status"],
        orderType: json["order_type"] == null ? null : json["order_type"],
        deliveryboy: json["deliveryboy"] == null ? null : json["deliveryboy"],
        deliveryStatus:
            json["delivery_status"] == null ? null : json["delivery_status"],
        shippingAddress:
            json["shipping_address"] == null ? null : json["shipping_address"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        orderDate: json["order_date"] == null
            ? null
            : DateTime.parse(json["order_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "order_id": orderId == null ? null : orderId,
        "user": user == null ? null : user,
        "product": product == null
            ? null
            : List<dynamic>.from(product.map((x) => x.toJson())),
        "qty": qty == null ? null : qty,
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
      };
}
