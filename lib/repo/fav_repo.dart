import 'dart:convert';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:zaza/models/fav_model.dart';
import 'package:zaza/models/sign_up_response_model.dart';

Future<List<Datum>> getFavList(String userId) async {
  final String url = '${GlobalConfiguration().getValue('base_url')}favourite';
  final msg = jsonEncode({"user": userId});
  var client = http.Client();
  var response = await client.post(url, body: msg);
  print(response.statusCode);
  try {
    if (response.statusCode == 200) {
      if (FavModel.fromJson(json.decode(response.body)).message ==
          "Successfully Fetch.") {
        // print("...............");
        // print(FavModel.fromJson(json.decode(response.body)));
        // print("...............");
        return FavModel.fromJson(json.decode(response.body)).data.data;
      } else
        return null;
    } else
      return null;
  } on Exception catch (e) {
    print(e.toString());
    return null;
  }
}

Future<bool> addToFav(String productId, String userId) async {
  final String url = '${GlobalConfiguration().getValue('base_url')}favourite';
  final msg = jsonEncode({"user": userId, "product": productId});
  var client = http.Client();
  var response = await client.post(url, body: msg);
  print(response.statusCode);
  if (response.statusCode == 200) {
    print("...............");
    // print(response.body);
    print("...............");
    return SignUpResponse.fromJson(json.decode(response.body)).status;
  } else
    return false;
}

Future<bool> delFromFav(String tableId) async {
  final String url = '${GlobalConfiguration().getValue('base_url')}favourite';
  final msg = jsonEncode({"id": tableId});
  var client = http.Client();
  var response = await client.post(url, body: msg);
  print(response.statusCode);
  if (response.statusCode == 200) {
    print("...............");
    return SignUpResponse.fromJson(json.decode(response.body)).status;
  } else
    return null;
}
