import 'package:flutter/material.dart';

class OrdersScreenWidget extends StatefulWidget {
  OrdersScreenWidget({Key key}) : super(key: key);

  @override
  _OrdersScreenWidgetState createState() => _OrdersScreenWidgetState();
}

class _OrdersScreenWidgetState extends State<OrdersScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Orders"),
      ),
    );
  }
}
