import 'package:flutter/material.dart';

import 'package:zaza/models/order_status.dart';

class TagWidget extends StatelessWidget {
  final index;
  final List<DeliveryStatus> list;

  const TagWidget({Key key, this.index, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            list[int.parse(index) - 1].tagName,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: list[int.parse(index) - 1].color,
            borderRadius: BorderRadius.circular(4.0)),
      ),
    );
  }
}
