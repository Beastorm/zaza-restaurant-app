import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:zaza/models/user_account_model.dart';

Future<UserData> getUserInfo(String userId) async {
  final String url = '${GlobalConfiguration().getValue('base_url')}myprofile';
  final msg = jsonEncode({"user": userId});
  var client = http.Client();
  var response = await client.post(url, body: msg);
  print(response.statusCode);
  if (response.statusCode == 200) {
    print("...............");
    print(UserAccountModel.fromJson(json.decode(response.body)));
    print("...............");

    return UserAccountModel.fromJson(json.decode(response.body)).data;
  } else
    return null;
}

savedUserAddress(String userId, String address, String postalCode) async {
  final String url = '${GlobalConfiguration().getValue('base_url')}myaddress';
  final msg =
      jsonEncode({"user": userId, "address": address, "pin": postalCode});

  var client = http.Client();
  await client.post(url, body: msg);
}

deleteUserAddress(String tableId) async {
  final String url = '${GlobalConfiguration().getValue('base_url')}myaddress';
  final msg = jsonEncode({"id": tableId});
  var client = http.Client();
  await client.post(url, body: msg);
}

updateUserInfo(String tableId, String email, String mobile) async {
  final String url =
      '${GlobalConfiguration().getValue('base_url')}myprofileedit';
  final msg = jsonEncode({"id": tableId, "email": email, "mobile": mobile});
  var client = http.Client();
  await client.post(url, body: msg);
}
