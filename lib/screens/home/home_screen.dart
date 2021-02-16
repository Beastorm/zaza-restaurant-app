import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../contants.dart';
import '../../controllers/home_controller.dart';
import '../../models/products_model.dart';
import '../../utlities/text_captitalize.dart';
import '../not_login_screen.dart';
import '../product_details/product_details_screen.dart';
import '../products_screen/product_screen.dart';

class HomeScreenWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  HomeScreenWidget({Key key, this.parentScaffoldKey}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final pref = GetStorage();
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 16.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: secondaryColor,
                          ),
                          onPressed: () {
                            widget.parentScaffoldKey.currentState.openDrawer();
                          },
                        ),
                        Container(
                          height: 48.0,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "Search Foods",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                width: 48,
                              ),
                              CircleAvatar(
                                backgroundColor: secondaryColor,
                                child: Container(
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              border: Border.all(color: secondaryColor)),
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: () => pref.hasData("isLogin")
                                ? Get.toNamed("/Cart")
                                : NotLoginScreenWidget(),
                            child: SvgPicture.asset("assets/images/cart.svg")),
                        // SizedBox(
                        //   width: 16,
                        // ),
                        // Icon(
                        //   Icons.notifications,
                        //   color: secondaryColor,
                        // ),
                        SizedBox(
                          width: 24.0,
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(color: secondaryColor)),
                ),
              ),
              SizedBox(height: 32.0),
              LimitedBox(
                maxHeight: 140,
                child: GetX<HomeController>(
                  builder: (controller) => ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categoryList.length,
                    itemBuilder: (contex, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductScreenWidget(
                                categoryId: controller.categoryList[index].id,
                                name: controller.categoryList[index].name,
                                no: controller.categoryList.length.toString(),
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(150.0),
                                  child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      height: 72,
                                      width: 72,
                                      imageUrl:
                                          controller.categoryList[index].image),
                                ),
                                SizedBox(height: 8.0),
                                Expanded(
                                  child: Text(
                                    controller.categoryList[index].name,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              GetX<HomeController>(
                builder: (controller) => Container(
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 180,
                      //aspectRatio: 16 / 9,
                      viewportFraction: 0.95,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 8),
                      autoPlayAnimationDuration: Duration(milliseconds: 1200),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: controller.bannerList.length,
                    itemBuilder: (context, index) {
                      var sliderItem = controller.bannerList[index];
                      return Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: sliderItem.image,
                            height: 180,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => Image.asset(
                              'assets/images/loading.gif',
                              fit: BoxFit.cover,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                      );
                    },
                  ),
                ),
              ),
// new Products section
              LimitedBox(
                maxHeight: 200,
                child: GetX<HomeController>(
                  builder: (controller) {
                    return Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 16.0,
                                ),
                                SvgPicture.asset(
                                    "assets/images/ic_fiber_new_24px.svg"),
                                SizedBox(
                                  width: 12.0,
                                ),
                                Text(
                                  "New Foods",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.newProductsList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    print(controller.newProductsList[index]
                                        is ProductItem);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return ProductDetailsScreenWidget(
                                          productItem:
                                              controller.newProductsList[index],
                                        );
                                      }),
                                    );
                                  },
                                  child: Container(
                                    child: Column(children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(150.0),
                                        child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            height: 72,
                                            width: 72,
                                            imageUrl: controller
                                                .newProductsList[index].image),
                                      ),
                                      SizedBox(height: 8.0),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            controller
                                                .newProductsList[index].name,
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 72.0,
              ),

              // veg section.....................

              GetX<HomeController>(
                builder: (controller) {
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 16.0,
                            ),
                            Container(
                              child: Stack(
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
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                      radius: 8.0,
                                      backgroundColor: Colors.green)
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Text(
                              "Veg Foods",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.72,
                          ),
                          itemCount: controller.vegList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return ProductDetailsScreenWidget(
                                        productItem: controller.vegList[index]);
                                  }),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
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
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                        ),
                                        child: CachedNetworkImage(
                                          height: 160.0,
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              controller.vegList[index].image,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            capitalizeText(
                                              controller.vegList[index].name,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                          ),
                                          child: Text(
                                            "\$${controller.vegList[index].price}",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 48.0,
              ),
              // non veg section.....................

              GetX<HomeController>(
                builder: (controller) {
                  return Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 16.0,
                            ),
                            Container(
                              child: Stack(
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
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                      radius: 8.0, backgroundColor: Colors.red)
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Text(
                              "Non-Veg Foods",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.72,
                          ),
                          itemCount: controller.nonVegList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return ProductDetailsScreenWidget(
                                      productItem: controller.nonVegList[index],
                                    );
                                  }),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
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
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                        ),
                                        child: CachedNetworkImage(
                                          height: 160.0,
                                          fit: BoxFit.cover,
                                          imageUrl: controller
                                              .nonVegList[index].image,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            capitalizeText(
                                              controller.nonVegList[index].name,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                          ),
                                          child: Text(
                                            "\$${controller.nonVegList[index].price}",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 48.0,
              ),
              // DISCOUNT section.....................

              // GetX<HomeController>(builder: (controller) {
              //   return Container(
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             SizedBox(
              //               width: 16.0,
              //             ),
              //             SvgPicture.asset("assets/images/discount.svg"),
              //             SizedBox(
              //               width: 12.0,
              //             ),
              //             Text(
              //               "Discounted Foods",
              //               style: TextStyle(
              //                 fontSize: 18.0,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             )
              //           ],
              //         ),
              //         GridView.builder(
              //           shrinkWrap: true,
              //           physics: NeverScrollableScrollPhysics(),
              //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             childAspectRatio: 0.72,
              //           ),
              //           itemBuilder: (context, index) {
              //             return GestureDetector(
              //               onTap: () {
              //                 Navigator.of(context).push(
              //                   MaterialPageRoute(
              //                     builder: (context) =>
              //                         ProductDetailsScreenWidget(
              //                       productItem: controller.discountList[index],
              //                     ),
              //                   ),
              //                 );
              //               },
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Container(
              //                   decoration: BoxDecoration(
              //                     color: Colors.white,
              //                     borderRadius: BorderRadius.all(
              //                       Radius.circular(8.0),
              //                     ),
              //                     boxShadow: [
              //                       BoxShadow(
              //                         color: Colors.grey.withOpacity(0.3),
              //                         spreadRadius: 1,
              //                         blurRadius: 2,
              //                         offset: Offset(
              //                             0, 0), // changes position of shadow
              //                       ),
              //                     ],
              //                   ),
              //                   child: Column(
              //                     children: [
              //                       ClipRRect(
              //                         borderRadius: BorderRadius.only(
              //                           topLeft: Radius.circular(8.0),
              //                           topRight: Radius.circular(8.0),
              //                         ),
              //                         child: CachedNetworkImage(
              //                           height: 160.0,
              //                           fit: BoxFit.cover,
              //                           imageUrl: controller
              //                               .discountList[index].image,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Align(
              //                           alignment: Alignment.topLeft,
              //                           child: Text(
              //                             capitalizeText(
              //                               controller.discountList[index].name,
              //                             ),
              //                             overflow: TextOverflow.ellipsis,
              //                             style: TextStyle(
              //                                 fontWeight: FontWeight.bold,
              //                                 fontSize: 16.0),
              //                           ),
              //                         ),
              //                       ),
              //                       Align(
              //                         alignment: Alignment.topLeft,
              //                         child: Padding(
              //                           padding: const EdgeInsets.only(
              //                             left: 8.0,
              //                           ),
              //                           child: Text(
              //                             "\$${controller.discountList[index].price}",
              //                             style: TextStyle(
              //                                 fontSize: 16.0,
              //                                 color: Colors.green,
              //                                 fontWeight: FontWeight.bold),
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             );
              //           },
              //         )
              //       ],
              //     ),
              //   );
              // }),
              SizedBox(
                height: 48.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
