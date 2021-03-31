import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaza/screens/product_details/product_details_screen.dart';

import '../../contants.dart';
import '../../controllers/search_controller.dart';

class SearchFoodItemScreenWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.search),
                      title: Form(
                        key: _formKey,
                        child: TextFormField(
                          //  controller: controller,
                          controller: searchController.textEditingController,
                          keyboardType: TextInputType.text,
                          //onSaved: (input) => _con.user.name = input,
                          validator: (input) =>
                              input.trim.toString().length == 0
                                  ? "should not be empty"
                                  : null,
                          showCursor: true,
                          autofocus: true,
                          decoration: InputDecoration(
                              hintText: 'Search', border: InputBorder.none),
                          // onChanged: onSearchTextChanged,
                        ),
                      ),
                      trailing: RaisedButton(
                        color: primaryColor,
                        child: Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            searchController.requestForSearch();
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  LimitedBox(
                    maxHeight: 20000000,
                    child: GetX<SearchController>(builder: (controller) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.searchResultList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(ProductDetailsScreenWidget(
                                productItem: controller.searchResultList[index],
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                padding: EdgeInsets.only(left: 16.0),
                                alignment: Alignment.centerLeft,
                                height: 56.0,
                                child: Text(
                                    controller.searchResultList[index].name),
                                decoration: BoxDecoration(
                                  color: Colors.white.withAlpha(210),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
