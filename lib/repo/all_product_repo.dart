import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import '../models/all_products_with_category.dart';

Future<List<Datum>> getProductWithCategory() async {
  final String url =
      '${GlobalConfiguration().getValue('base_url')}categoryWiseProducts';

  var client = http.Client();
  var response = await client.post(url);
  print("response.statusCode");
  if (response.statusCode == 200) {
    print("...............");
    print(ProductListOfCategory.fromJson(json.decode(response.body)));
    print("...............");
    return ProductListOfCategory.fromJson(json.decode(response.body)).data;
  } else
    return null;
}
