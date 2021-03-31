import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../models/app_info_model.dart';

Future<AppInfoData> getAppInfo() async {
  final String url = '${GlobalConfiguration().getValue('base_url')}setting';

  var client = http.Client();
  var response = await client.post(url);
  print("response.statusCode");

  if (response.statusCode == 200) {
    return AppInfoModel.fromJson(json.decode(response.body)).data[0];
  } else
    return null;
}
