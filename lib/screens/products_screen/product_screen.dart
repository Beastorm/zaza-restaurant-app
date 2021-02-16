import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaza/contants.dart';
import 'package:zaza/controllers/products_controller.dart';
import 'package:zaza/screens/product_details/product_details_screen.dart';

// ignore: must_be_immutable
class ProductScreenWidget extends StatefulWidget {
  String categoryId;
  String name;
  String no;

  ProductScreenWidget({this.categoryId, this.name, this.no, Key key})
      : super(key: key);

  @override
  _ProductScreenWidgetState createState() => _ProductScreenWidgetState();
}

class _ProductScreenWidgetState extends State<ProductScreenWidget> {
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    productController.getProducts(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.0,
              ),
              Container(
                width: 230,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  child: Row(
                    children: [
                      Text(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Obx(
                          () => Text(
                            productController.productList.length.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              LimitedBox(
                maxHeight: 1200000,
                child: GetX<ProductController>(
                  builder: (controller) => controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.productList.length > 0
                              ? controller.productList.length
                              : 0,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailsScreenWidget(
                                      productItem:
                                          controller.productList[index],
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 90),
                                        child: Container(
                                          color: controller.productList[index]
                                                      .type ==
                                                  "0"
                                              ? Colors.green
                                              : Colors.red,
                                          width: 32,
                                          height: 18,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 120,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: CachedNetworkImage(
                                                      width: 140,
                                                      height: 120,
                                                      fit: BoxFit.cover,
                                                      imageUrl: controller
                                                          .productList[index]
                                                          .image),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 12.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .productList[index]
                                                            .name,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                      SizedBox(
                                                        height: 8.0,
                                                      ),
                                                      Text(
                                                        "\$${controller.productList[index].price}",
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        controller
                                                                    .productList[
                                                                        index]
                                                                    .discount !=
                                                                "0"
                                                            ? "${controller.productList[index].discount}% OFF"
                                                            : "",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white.withAlpha(210),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                spreadRadius: 1,
                                                blurRadius: 2,
                                                offset: Offset(0,
                                                    0), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
