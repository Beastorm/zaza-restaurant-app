import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../models/order_model.dart';

Future<List<OrderData>> getOrders(String userId) async {
  final msg = jsonEncode({"user": userId});
  final String url = '${GlobalConfiguration().getValue('base_url')}order';

  var client = http.Client();
  var response = await client.post(url, body: msg);
  print(userId);
  if (response.statusCode == 200) {
    print("...............");

    print("...............");
    return orderModelFromJson(response.body).data;
  } else
    return orderModelFromJson(response.body).data;
}
