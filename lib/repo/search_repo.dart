import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../models/products_model.dart';
import '../models/search_product_model.dart';

Future<List<ProductItem>> searchProduct(String query) async {
  final String url =
      '${GlobalConfiguration().getValue('base_url')}searchProduct';
  final msg = jsonEncode({"keyword": query});
  var client = http.Client();
  var response = await client.post(url, body: msg);
  print("response.statusCode");
  if (response.statusCode == 200) {
    print("...............");

    print("...............");
    return searchProductModelFromJson(response.body).data;
  } else
    return searchProductModelFromJson(response.body).data;
}
