import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../models/user_account_model.dart';

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

updateUserInfo(String userId, String email, String mobile, String type) async {
  final String url =
      '${GlobalConfiguration().getValue('base_url')}myprofileedit';
  final msg = jsonEncode(
      {"id": userId, "email": email, "mobile": mobile, "type": type});
  var client = http.Client();
  await client.post(url, body: msg);
}

editUserImage(File imageFile, String userId) async {
  final String url =
      '${GlobalConfiguration().getValue('base_url')}myprofilepictureedit';

  var stream =
      new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length = await imageFile.length();

  var uri = Uri.parse(url);

  var request = new http.MultipartRequest("POST", uri);
  request.fields['id'] = userId;
  var multipartFile = new http.MultipartFile('item_image', stream, length,
      filename: basename(imageFile.path));
  //contentType: new MediaType('image', 'png'));
  request.files.add(multipartFile);
  var response = await request.send();
  print(response.statusCode);
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
}
