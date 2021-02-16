import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:zaza/models/banner_model.dart';

Future<List<BannerItem>> getAllBanner() async {
  final String url = '${GlobalConfiguration().getValue('base_url')}banners';
  //final String url = 'http://restaurant.aictpvtltd.com/api/banners';
  print(url);
  //Response response = await Dio().get(url);
  var client = http.Client();
  var response = await client.post(url);
  print(response.statusCode);
  if (response.statusCode == 200) {
    print("...............");
    print(Banner.fromJson(json.decode(response.body)));
    print("...............");
    return Banner.fromJson(json.decode(response.body)).data;
  } else
    return null;
}
