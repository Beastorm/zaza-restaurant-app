import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:zaza/controllers/cart_controller.dart';

import '../../contants.dart';

class ByCardPaymentScreenWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final CartController controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 0.0,
        backgroundColor: secondaryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Card Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 56,
        color: Colors.greenAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 40.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                child: Text(
                  "Cart Bill: \$${controller.totalBillOfCart()}",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(200),
                  bottomRight: Radius.circular(200),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "Pay Now",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Icon(
                  Icons.payment,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 4.0,
                ),
              ],
            ),
            SizedBox(
              width: 16.0,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                "Total Bill: \$${controller.totalBillOfCart()}",
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            CreditCardForm(
              formKey: _formKey,
              // Required
              onCreditCardModelChange: (CreditCardModel data) {},
              // Required
              themeColor: Colors.red,
              obscureCvv: true,
              obscureNumber: true,
              cardNumberDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number',
                hintText: 'XXXX XXXX XXXX XXXX',
              ),
              expiryDateDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Expired Date',
                hintText: 'XX/XX',
              ),
              cvvCodeDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'CVV',
                hintText: 'XXX',
              ),
              cardHolderDecoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Card Holder',
              ),
            ),
            SizedBox(
              height: 56.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.security,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "All payment details are secured.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
