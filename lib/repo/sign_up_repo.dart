import 'dart:convert';
import 'dart:io';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:zaza/models/sign_up_response_model.dart';

Future<bool> signUpProcess(
    String mobile, String email, String name, String pwd) async {
  final String url = '${GlobalConfiguration().getValue('base_url')}register';
  var client = http.Client();
  final msg = jsonEncode(
    {"name": name, "email": email, "mobile": mobile, "password": pwd},
  );
  var response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: msg,
  );

  if (response.statusCode == 200) {
    return SignUpResponse.fromJson(json.decode(response.body)).status;
  }
  return SignUpResponse.fromJson(json.decode(response.body)).status;
}
