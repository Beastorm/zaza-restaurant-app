import 'dart:convert';

//import 'package:dio/dio.dart';

import 'package:global_configuration/global_configuration.dart';
import 'package:zaza/models/category_model.dart';
import 'package:http/http.dart' as http;

Future<List<CategoryItem>> getAllCategory() async {
  final String url = '${GlobalConfiguration().getValue('base_url')}categories';
  //final String url = 'http://restaurant.aictpvtltd.com/api/categories';
  print(url);
  //Response response = await Dio().get(url);
  var client = http.Client();
  var response = await client.post(url);
  print(response.statusCode);
  if (response.statusCode == 200) {
    print("...............");
    print(Category.fromJson(json.decode(response.body)).data[0].id);
    print("...............");
    if (Category.fromJson(json.decode(response.body)).data.length == 0) {
      return null;
    }
    return Category.fromJson(json.decode(response.body)).data;
  } else
    return null;
}
