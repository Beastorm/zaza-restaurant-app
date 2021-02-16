import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../models/postal_code_model.dart';
import '../models/restaurant_timing_model.dart';

Future<List<TimingData>> getRestaurantInfo() async {
  final String url = '${GlobalConfiguration().getValue('base_url')}hotelTime';

  var client = http.Client();
  var response = await client.post(url);
  print("response.statusCode");

  if (response.statusCode == 200) {
    print("...............");
    print(RestaurantTimingModel.fromJson(json.decode(response.body)));
    print("...............");
    return RestaurantTimingModel.fromJson(json.decode(response.body)).data;
  } else
    return null;
}

Future<List<Datum>> getAllPinCodes() async {
  final String url = '${GlobalConfiguration().getValue('base_url')}pincode';

  var client = http.Client();
  var response = await client.post(url);
  if (response.statusCode == 200) {
    print("...............");
    print(PostalCodeModel.fromJson(json.decode(response.body)));
    print("...............");
    return PostalCodeModel.fromJson(json.decode(response.body)).data;
  } else
    return null;
}
