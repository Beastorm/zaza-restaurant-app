import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zaza/repo/payment_repo.dart';
import 'package:zaza/screens/success_order/success_order_screen.dart';

class OrderProcessController extends GetxController {
  GetStorage pref = GetStorage();

  TextEditingController firstLineController,
      cityController,
      stateController,
      countryController,
      postalCodeController;

  var cardHolderName;
  var cardNumber;
  var expiredDate;
  var csv;

  @override
  void onInit() {
    firstLineController = TextEditingController();
    cityController = TextEditingController();
    stateController = TextEditingController();
    countryController = TextEditingController();
    postalCodeController = TextEditingController();

    super.onInit();
  }

  requestForPayment(String amount, String product, String qty, String notes,
      String shippingAddress, String pincode) async {
    String address =
        "${firstLineController.text}, ${cityController.text}, ${stateController.text}, ${countryController.text} ,${postalCodeController.text} ,";

    await doPayment(
        cardNumber,
        expiredDate,
        expiredDate,
        csv,
        "FOOD",
        amount,
        cardHolderName,
        address,
        cityController.text,
        stateController.text,
        postalCodeController.text,
        countryController.text,
        pref.read("mobile"),
        pref.read("email"));

    requestForSavePayload(product, qty, notes, amount, shippingAddress, "1",
        "txnId", "Payment Gateway", "Cash", "1", pincode);
  }

  requestForSavePayload(
    String product,
    String qty,
    String notes,
    String amount,
    String shippingAddress,
    String status,
    String txnId,
    String paymentMethod,
    String paymentBy,
    String orderType,
    String pincode,
  ) async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    var res = await savePayload(
        generateOrderId(),
        pref.read("userId"),
        product,
        qty,
        notes,
        amount,
        paymentMethod,
        paymentBy,
        txnId,
        status,
        orderType,
        shippingAddress,
        pincode);

    if (res) {
      Get.back();
      Get.to(SuccessOrderWidget());
    } else {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  String generateOrderId() {
    return "zaza" + DateTime.now().millisecondsSinceEpoch.toString();
  }

  String generateTxnId() {
    return "txn_id" + DateTime.now().millisecondsSinceEpoch.toString();
  }

// For Card Payment
// 1. first we have to do payment
//2. Then save payload to server

// For PayLater
//1. Only we have to send payload to the server

// Payload
// ----------------------------------

// 	name: order
// 	method: post
//         	field:
// 		order_id,
// 		user,
// 		product [ Like : 1,2,3 ],
// 		qty [ Like : 1,2,3 ]
// 		notes [ Which is Save in the cart ]
// 		amount
// 		payment_method [ Payment Gateway / Cod ]
// 		payment_by [ Card / Cash ]
// 		transaction_id [ Coming From Payment Date way / in Case of cod make the transaction Id ]
// 		status [ 1 ]
// 		order_type [ Delivery = 1 / Pickup = 2 ]
// 		shipping_address
// 		pincode
// 		(Content: Application/json; charset=UTF-8)
//         	response:
// 		"message": "Product Added In Order List.",
// 		"response_code": "200",
// 		"status": true,

//////////////////////////////////////////////

// Do Payment For User:
// ----------------------------------

// 	name: do_payment
// 	method: post
//         	field:
// 		card
// 		month
// 		year
// 		csv
// 		service
// 		amount
// 		fname
// 		address
// 		city
// 		state
// 		zip
// 		country
// 		mobile
// 		email
// 	response:
// 		"message" => "Successfully Done/Fail Payment",
//                     	"response_code" => "200",
//                     	"status" => true,
//                     	"data" => transaction_id,approval_code

}
