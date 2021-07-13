import 'package:flutter/material.dart';

class DeliveryStatus {
  var tagName;
  var color;
  DeliveryStatus({
    this.tagName,
    this.color,
  });

  static getList() {
    return ([
      DeliveryStatus(tagName: "InProcess", color: Colors.yellowAccent),
      DeliveryStatus(tagName: "Out For Delivery", color: Colors.orangeAccent),
      DeliveryStatus(tagName: "Delivered", color: Colors.greenAccent),
      DeliveryStatus(tagName: "Canceled", color: Colors.redAccent),
    ]);
  }
}
