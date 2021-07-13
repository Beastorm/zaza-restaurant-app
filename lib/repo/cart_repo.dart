import 'dart:convert';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:zaza/models/cart_model.dart';
import 'package:zaza/models/sign_up_response_model.dart';

Future<List<Datum>> getCartList(String userId) async {
  final String url = '${GlobalConfiguration().getValue('base_url')}cart';
  final msg = jsonEncode({"user": userId});
  var client = http.Client();
  var response = await client.post(url, body: msg);
  print(response.statusCode);
  if (response.statusCode == 200) {
    if (CartModel.fromJson(json.decode(response.body)).message ==
        "Successfully Fetch.") {
      print("...............");
      print(CartModel.fromJson(json.decode(response.body)));
      print("...............");
      return CartModel.fromJson(json.decode(response.body)).data.data;
    } else
      return null;
  } else
    return null;
}

Future<bool> addToCart(
    String productId, String userId, String qty, String cost,String preference) async {
  final String url = '${GlobalConfiguration().getValue('base_url')}cart';
  final msg = jsonEncode(
      {"user": userId, "product": productId, "qty": qty, "price": cost});
  var client = http.Client();
  var response = await client.post(url, body: msg);
  print(response.statusCode);
  if (response.statusCode == 200) {
    print("...............");
    // print(response.body);
    print("...............");
    return SignUpResponse.fromJson(json.decode(response.body)).status;
  } else
    return false;
}

Future<bool> delFromCart(String tableId) async {
  final String url = '${GlobalConfiguration().getValue('base_url')}cart';
  final msg = jsonEncode({"id": tableId});

  var client = http.Client();
  var response = await client.post(url, body: msg);
  print(response.statusCode);

  if (response.statusCode == 200) {
    print("...............");
    return SignUpResponse.fromJson(json.decode(response.body)).status;
  } else
    return null;
}

updateCart(String tableId, String newQty, String discountedPrice) async {
  final String url = '${GlobalConfiguration().getValue('base_url')}cart';
  final msg =
      jsonEncode({"id": tableId, "qty": newQty, "price": discountedPrice});

  var client = http.Client();
  var response = await client.post(url, body: msg);
  if (response.statusCode == 200) {
    print("...............");
    return SignUpResponse.fromJson(json.decode(response.body)).status;
  } else
    return null;
}
