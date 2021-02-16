import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zaza/contants.dart';
import 'package:zaza/controllers/cart_controller.dart';
import 'package:zaza/controllers/favourite%20_product_controller.dart';
import 'package:zaza/controllers/products_controller.dart';
import 'package:zaza/models/products_model.dart';
import 'package:zaza/utlities/text_captitalize.dart';

// ignore: must_be_immutable
class ProductDetailsScreenWidget extends StatefulWidget {
  ProductItem productItem;

  ProductDetailsScreenWidget({this.productItem, Key key}) : super(key: key);

  @override
  _ProductDetailsScreenWidgetState createState() =>
      _ProductDetailsScreenWidgetState();
}

class _ProductDetailsScreenWidgetState
    extends State<ProductDetailsScreenWidget> {
  final FavouriteController favouriteController =
      Get.put(FavouriteController());
  final CartController cartController = Get.put(CartController());
  final ProductController productController = Get.put(ProductController());

  final pref = GetStorage();

  @override
  void initState() {
    productController.getProducts(widget.productItem.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: GestureDetector(
          onTap: () {
            cartController.addProductInCartList(
                widget.productItem.id,
                "1",
                cartController.getFoodCost(
                    widget.productItem.price, widget.productItem.discount));
          },
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.add_shopping_cart,
                    color: Colors.grey,
                  ),
                  Text(
                    "Add to Cart",
                    style: TextStyle(fontSize: 16.0, color: secondaryColor),
                  ),
                ],
              ),
            ),
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
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
        appBar: AppBar(
          titleSpacing: 2.0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            capitalizeText(
              widget.productItem.name,
            ),
            style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w400,
                fontSize: 18.0),
          ),
          backgroundColor: secondaryColor,
          actions: [
            pref.hasData("isLogin")
                ? GestureDetector(
                    onTap: () => Get.toNamed("/Cart"),
                    child: SvgPicture.asset(
                      "assets/images/cart.svg",
                      color: Colors.white,
                    ),
                  )
                : SizedBox(),
            SizedBox(
              width: 16.0,
            )
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl: widget.productItem.image,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Image.asset(
                                'assets/images/loading.gif',
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 16,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text(
                                  capitalizeText(widget.productItem.name),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.only(),
                              ),
                            ),
                          ),
                          pref.hasData("isLogin")
                              ? Positioned(
                                  top: 12.0,
                                  right: 12.0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.bookmark_border_outlined,
                                        color: secondaryColor,
                                      ),
                                      onPressed: () {
                                        favouriteController.addProductFavList(
                                            widget.productItem.id);
                                      },
                                    ),
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 16.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
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
                            CircleAvatar(
                              radius: 8.0,
                              backgroundColor: widget.productItem.type == "0"
                                  ? Colors.green
                                  : Colors.red,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          "|\n|",
                          style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        SvgPicture.asset("assets/images/price-tag.svg"),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 4),
                            child: Text(
                              "\$${widget.productItem.price}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        int.parse(widget.productItem.discount) > 0
                            ? Text(
                                "|\n|",
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.5)),
                              )
                            : Text(""),
                        SizedBox(
                          width: 12.0,
                        ),
                        int.parse(widget.productItem.discount) > 0
                            ? Container(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 4),
                                  child: Text(
                                    "${widget.productItem.discount}% OFF",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.0),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            "Ingredients",
                            style: TextStyle(
                                color: Colors.black87, fontSize: 16.0),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: secondaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: widget.productItem.description != null
                              ? Text(
                                  widget.productItem.description,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14.0),
                                )
                              : Text(
                                  "No Ingredient Information is available for now",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14.0),
                                ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32.0, left: 16.0, bottom: 24.0),
                    child: Text(
                      "Similar Food Items",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
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
                                            padding: const EdgeInsets.only(
                                                bottom: 90),
                                            child: Container(
                                              color: controller
                                                          .productList[index]
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
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: CachedNetworkImage(
                                                          width: 140,
                                                          height: 120,
                                                          fit: BoxFit.cover,
                                                          imageUrl: controller
                                                              .productList[
                                                                  index]
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
                                                                .productList[
                                                                    index]
                                                                .name,
                                                            overflow:
                                                                TextOverflow
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
                                                                color: Colors
                                                                    .orange,
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
                                                color:
                                                    Colors.white.withAlpha(210),
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
          ],
        ),
      ),
    );
  }
}
