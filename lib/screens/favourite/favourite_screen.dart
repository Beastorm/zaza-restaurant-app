import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../contants.dart';
import '../../controllers/favourite%20_product_controller.dart';
import '../product_details/product_details_screen.dart';

class FavouriteScreenWidget extends StatefulWidget {
  FavouriteScreenWidget({Key key}) : super(key: key);

  @override
  _FavouriteScreenWidgetState createState() => _FavouriteScreenWidgetState();
}

class _FavouriteScreenWidgetState extends State<FavouriteScreenWidget> {
  final FavouriteController favouriteController =
  Get.put(FavouriteController());


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
                        "Favourite",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Obx(
                              () =>
                              Text(
                                favouriteController.favouriteList.length
                                    .toString(),
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
                maxHeight: 1000000,
                child: GetX<FavouriteController>(
                  builder: (controller) =>
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.favouriteList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailsScreenWidget(
                                        productItem: controller
                                            .favouriteList[index]
                                            .productDetails,
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
                                        color: controller.favouriteList[index]
                                            .productDetails.type ==
                                            "0"
                                            ? Colors.green
                                            : Colors.red,
                                        width: 32,
                                        height: 18,
                                      ),
                                    ),
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 140,
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
                                                        height: 140,
                                                        fit: BoxFit.cover,
                                                        imageUrl: controller
                                                            .favouriteList[index]
                                                            .productDetails
                                                            .image),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          controller
                                                              .favouriteList[index]
                                                              .productDetails
                                                              .name,
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              fontSize: 16.0),
                                                        ),
                                                        SizedBox(
                                                          height: 8.0,
                                                        ),
                                                        Text(
                                                          "\$${controller
                                                              .favouriteList[index]
                                                              .productDetails
                                                              .price}",
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                              FontWeight.bold),
                                                        ),
                                                        Text(
                                                          controller
                                                              .favouriteList[
                                                          index]
                                                              .productDetails
                                                              .discount !=
                                                              "0"
                                                              ? "${controller
                                                              .favouriteList[index]
                                                              .productDetails
                                                              .discount}% OFF"
                                                              : "",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .orange,
                                                              fontSize: 16.0,
                                                              fontWeight: FontWeight
                                                                  .normal),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withAlpha(
                                                  210),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color:
                                                  Colors.grey.withOpacity(0.3),
                                                  spreadRadius: 1,
                                                  blurRadius: 2,
                                                  offset: Offset(0,
                                                      0), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            right: 8,
                                            bottom: 8,
                                            child: InkWell(
                                              onTap: () {
                                                controller.delFromFavList(
                                                    controller
                                                        .favouriteList[index]
                                                        .id);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 48,
                                                height: 48,
                                                child: Icon(
                                                  Icons.delete_outline_rounded,
                                                  color: secondaryColor,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius
                                                      .all(
                                                    Radius.circular(200),
                                                  ),
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
                                          ),
                                        ],
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
