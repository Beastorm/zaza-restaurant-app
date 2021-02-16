import 'dart:io';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:zaza/models/products_model.dart';

Future<List<ProductItem>> getAllProduct(String categoryId) async {
  final String url =
      '${GlobalConfiguration().getValue('base_url')}singleCategoryProducts';
  var client = http.Client();
  final msg = jsonEncode({"categoryId": categoryId});
  var response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: msg,
  );
  print(" category id .........  $categoryId");
  if (response.statusCode == 200) {
    print("...............");
    print(ProductModel.fromJson(json.decode(response.body)).data[0].id);
    print("...............");
    if (ProductModel.fromJson(json.decode(response.body)).data.length == 0)
      return null;
    return ProductModel.fromJson(json.decode(response.body)).data;
  } else
    return null;
}
