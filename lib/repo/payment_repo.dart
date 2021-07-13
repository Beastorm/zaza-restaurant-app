
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:global_configuration/global_configuration.dart';
import 'package:zaza/models/response_model.dart';

Future<bool> doPayment(
  String card,
  String month,
  String year,
  String csv,
  String service,
  String amount,
  String fname,
  String address,
  String city,
  String state,
  String zip,
  String country,
  String mobile,
  String email,
) async {
  final String url = '${GlobalConfiguration().getValue('base_url')}do_payment';

  final msg = jsonEncode({
    "card": card,
    "month": month,
    "year": year,
    "csv": csv,
    "service": service,
    "amount": amount,
    "fname": fname,
    "address": address,
    "city": city,
    "state": state,
    "zip": zip,
    "country": country,
    "mobile": mobile,
    "email": email,
  });
  var client = http.Client();
  var response = await client.post(url, body: msg);
  print(response.statusCode);
  if (response.statusCode == 200) {
    return true;
  } else
    return false;
}

Future<bool> savePayload(
  String orderId,
  String user,
  String product,
  String qty,
  String notes,
  String amount,
  String paymentMethod,
  String paymentBy,
  String txnId,
  String status,
  String orderType,
  String shippingAddress,
  String pincode,
) async {
  final String url = '${GlobalConfiguration().getValue('base_url')}order';

  final msg = jsonEncode({
    "order_id": orderId,
    "user": user,
    "product": product,
    "qty": qty,
    "notes": notes,
    "amount": amount,
    "payment_method": paymentMethod,
    "payment_by": paymentBy,
    "transaction_id": txnId,
    "status": status,
    "order_type": orderType,
    "shipping_address": shippingAddress,
    "pincode": pincode,
  });
  var client = http.Client();
  var response = await client.post(url, body: msg);
  print(response.statusCode);
  try {
    if (response.statusCode == 200) {
      bool status = responseModelFromJson(response.body).status;

      if (status)
        return true;
      else
        return false;
    } else
      return false;
  } on Exception catch (e) {
    return false;
  }
}
