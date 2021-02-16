import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:zaza/models/new_product_model.dart';

Future<List<NewProductItem>> getAllNewProduct() async {
  final String url = '${GlobalConfiguration().getValue('base_url')}newProducts';
  // final String url = 'http://restaurant.aictpvtltd.com/api/newProducts';
  print(url);
  //Response response = await Dio().get(url);
  var client = http.Client();
  var response = await client.post(url);
  print(response.statusCode);
  if (response.statusCode == 200) {
    print("...............");
    print(NewProduct.fromJson(json.decode(response.body)).data[0].id);
    print("...............");
    return NewProduct.fromJson(json.decode(response.body)).data;
  } else
    return null;
}
