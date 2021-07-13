import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../models/contact_model.dart';

Future<ContactData> getAppInfo() async {
  final String url = '${GlobalConfiguration().getValue('base_url')}contact';

  var client = http.Client();
  var response = await client.post(url);
  print("response.statusCode");

  if (response.statusCode == 200) {
    return ContactModel.fromJson(json.decode(response.body)).data[0];
  } else
    return null;
}
