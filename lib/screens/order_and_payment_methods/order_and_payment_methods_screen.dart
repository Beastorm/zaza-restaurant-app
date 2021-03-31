import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zaza/controllers/cart_controller.dart';
import 'package:zaza/screens/card_payment/by_card_payment.dart';

import '../../contants.dart';

class OrderAndPaymentMethodScreenWidget extends StatefulWidget {
  @override
  _OrderAndPaymentMethodScreenWidgetState createState() =>
      _OrderAndPaymentMethodScreenWidgetState();
}

class _OrderAndPaymentMethodScreenWidgetState
    extends State<OrderAndPaymentMethodScreenWidget> {
  final CartController controller = Get.find<CartController>();
  DateTime selectedDate = DateTime.now();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  // String _setTime, _setDate;
  String _hour, _minute, _time;
  String dateTime;
  TimeOfDay selectedTime;

  @override
  void initState() {
    selectedTime = TimeOfDay(
      hour: selectedDate.hour,
      minute: selectedDate.minute,
    );
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    _timeController.text = formatDate(
        DateTime(selectedDate.year, selectedDate.month, selectedDate.day,
            selectedTime.hour, selectedTime.minute),
        ["hh", ':', "nn", " ", "am"]).toString();

    super.initState();
  }

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
          "Payment Options",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
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
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 32.0,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "At What Time?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        width: 140,
                        height: 42,
                        margin: EdgeInsets.only(top: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _dateController,
                          onSaved: (String val) {
                            //_setDate = val;
                          },
                          decoration: InputDecoration(
                            disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            // labelText: 'Time',
                            contentPadding: EdgeInsets.only(top: 8.0),
                            prefixIcon: Icon(Icons.calendar_today_rounded),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        _selectTime(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 12),
                        width: 140,
                        height: 42,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: TextFormField(
                          controller: _timeController,
                          style: TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.center,
                          onSaved: (String val) {
                            //  _setTime = val;
                          },
                          enabled: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            // labelText: 'Time',
                            contentPadding: EdgeInsets.only(
                              top: 8.0,
                            ),
                            prefixIcon: Icon(Icons.access_time),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(210),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
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
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 24.0,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Payment Options",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        child: RaisedButton.icon(
                          icon: Icon(
                            Icons.credit_card_outlined,
                            color: Colors.white,
                          ),
                          elevation: 0.0,
                          onPressed: () {
                            Get.to(ByCardPaymentScreenWidget());
                          },
                          color: accentColor,
                          label: Text(
                            "By Card",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: Container(
                        child: RaisedButton.icon(
                          icon: Icon(
                            Icons.money,
                            color: Colors.white,
                          ),
                          elevation: 0.0,
                          onPressed: () {},
                          color: accentColor,
                          label: Text(
                            "By COD",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(210),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
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
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: selectedDate,
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(
        () {
          selectedTime = picked;
          _hour = selectedTime.hour.toString();
          _minute = selectedTime.minute.toString();
          _time = _hour + ' : ' + _minute;
          _timeController.text = _time;
          _timeController.text = formatDate(
              DateTime(selectedDate.year, selectedDate.month, selectedDate.day,
                  selectedTime.hour, selectedTime.minute),
              ["hh", ':', "nn", " ", "am"]).toString();
        },
      );
  }

  formatDate(DateTime dateTime, List list) {
    String median = dateTime.hour > 12 ? "PM" : "AM";
    return "${dateTime.hour} : ${dateTime.minute} $median";
  }
}
