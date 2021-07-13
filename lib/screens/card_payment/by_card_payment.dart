import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

import 'package:zaza/controllers/cart_controller.dart';
import 'package:zaza/controllers/order_process_controller.dart';

import '../../contants.dart';

class ByCardPaymentScreenWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final CartController controller = Get.find<CartController>();
  final OrderProcessController _orderProcessController =
      Get.find<OrderProcessController>();

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
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (_formKey.currentState.validate() &&
              _formKey2.currentState.validate()) {
            _orderProcessController.requestForPayment(
                controller.totalBillOfCart(),
                controller.getCartProductIdInStrigFormat(),
                controller.getCartParodutQtyInStringFormat(),
                "Dummy Notes",
                controller.shippingAddress.value,
                controller.zipController.text);
          }
        },
        child: Container(
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
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ListView(
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
                onCreditCardModelChange: (CreditCardModel data) {
                  _orderProcessController.cardNumber = data.cardNumber;
                  _orderProcessController.expiredDate = data.expiryDate;
                  _orderProcessController.csv = data.cvvCode;
                  _orderProcessController.cardHolderName = data.cardHolderName;
                },
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
                  labelText: 'CSV',
                  hintText: 'XXX',
                ),
                cardHolderDecoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Card Holder',
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Text(
                  "Other Info",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Form(
                  key: _formKey2,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _orderProcessController.firstLineController,
                        keyboardType: TextInputType.streetAddress,
                        //onSaved: (input) => _con.user.name = input,
                        validator: (input) =>
                            input.length < 1 ? "should_be_not_empty" : null,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.grey),
                          labelText: "First line",
                          labelStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: "building no, street no",
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller: _orderProcessController.cityController,
                        keyboardType: TextInputType.text,
                        //onSaved: (input) => _con.user.name = input,
                        validator: (input) => input.length < 1
                            ? "should_be_more_than_1_chars"
                            : null,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.grey),
                          labelText: "City",
                          labelStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: "Enter your City",
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller: _orderProcessController.stateController,
                        keyboardType: TextInputType.text,
                        //onSaved: (input) => _con.user.name = input,
                        validator: (input) => input.length < 1
                            ? "should_be_more_than_1_chars"
                            : null,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.grey),
                          labelText: "State",
                          labelStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: "Enter your State",
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller: _orderProcessController.countryController,
                        keyboardType: TextInputType.text,
                        //onSaved: (input) => _con.user.name = input,
                        validator: (input) => input.length < 1
                            ? "should_be_more_than_1_chars"
                            : null,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.grey),
                          labelText: "Country",
                          labelStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: "Enter your Country",
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        controller:
                            _orderProcessController.postalCodeController,
                        keyboardType: TextInputType.number,
                        //onSaved: (input) => _con.user.name = input,
                        validator: (input) => input.length != 5
                            ? "should_be_equal_to_5_digits"
                            : null,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.grey),
                          labelText: "Postal code",
                          labelStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          contentPadding: EdgeInsets.all(12),
                          hintText: "enter postal code",
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 32.0,
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
                      "All payment data details are secured.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
