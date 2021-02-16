import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../contants.dart';
import '../../controllers/home_controller.dart';
import '../products_screen/product_screen.dart';

class MenuScreenWidget extends StatefulWidget {
  MenuScreenWidget({Key key}) : super(key: key);

  @override
  _MenuScreenWidgetState createState() => _MenuScreenWidgetState();
}

class _MenuScreenWidgetState extends State<MenuScreenWidget> {
  final HomeController categoryController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                          "Menu",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                        Spacer(),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            categoryController.categoryList.length.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
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
                  maxHeight:
                      (130 * categoryController.categoryList.length).toDouble(),
                  child: GetX<HomeController>(
                    builder: (controller) => ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.categoryList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return ProductScreenWidget(
                                  categoryId: controller.categoryList[index].id,
                                  name: controller.categoryList[index].name,
                                );
                              }),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8.0,
                              left: 8.0,
                              right: 8.0,
                            ),
                            child: Container(
                              height: 120,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        width: 140,
                                        height: 120,
                                        fit: BoxFit.cover,
                                        imageUrl: controller
                                            .categoryList[index].image,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      controller.categoryList[index].name,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(210),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
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
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
