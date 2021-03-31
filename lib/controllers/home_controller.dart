import 'package:get/get.dart';

import '../models/all_products_with_category.dart';
import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/new_product_model.dart';
import '../models/products_model.dart';
import '../repo/all_product_repo.dart';
import '../repo/banners_repo.dart';
import '../repo/category_repo.dart';
import '../repo/new_product_repo.dart';

class HomeController extends GetxController {
  var categoryList = List<CategoryItem>().obs;
  var bannerList = List<BannerItem>().obs;
  var newProductsList = List<NewProductItem>().obs;

  var vegList = List<ListOfProduct>().obs;
  var nonVegList = List<ListOfProduct>().obs;
  var discountList = List<ListOfProduct>().obs;

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    getAllCategories();
    getAllBanners();
    getNewProducts();
    getProductofCategory();
    super.onInit();
  }

  getAllCategories() async {
    var categories = await getAllCategory();
    if (categories != null && categories.length > 0) {
      categoryList.assignAll(categories);
    } else
      categoryList.clear();
  }

  getAllBanners() async {
    var banners = await getAllBanner();
    if (banners != null && banners.length > 0) {
      bannerList.assignAll(banners);
    }
  }

  getNewProducts() async {
    var newProducts = await getAllNewProduct();
    if (newProducts != null && newProducts.length > 0) {
      newProductsList.assignAll(newProducts);
    }
  }

  getProductofCategory() async {
    List<Datum> list = await getProductWithCategory();
    if (list != null && list.length > 0) {
      if (getVeges(list).length > 0) {
        vegList.assignAll(getVeges(list));
      }

      if (getNonVeg(list).length > 0) {
        nonVegList.assignAll(getNonVeg(list));
      }

      if (getDiscountedProducts(list).length > 0) {
        discountList.assignAll(getDiscountedProducts(list));
      }
    }
  }

  List<ListOfProduct> getVeges(list) {
    List<ListOfProduct> vegesList = List<ListOfProduct>();

    for (Datum x in list) {
      for (ListOfProduct y in x.listOfProduct) {
        if (y.type == "0") {
          vegesList.add(y);
        }
      }
    }
    return vegesList;
  }

  List<ListOfProduct> getNonVeg(list) {
    List<ListOfProduct> nonVegesList = List<ListOfProduct>();

    for (Datum x in list) {
      for (ListOfProduct y in x.listOfProduct) {
        if (y.type == "1") {
          nonVegesList.add(y);
        }
      }
    }
    return nonVegesList;
  }

  List<ListOfProduct> getDiscountedProducts(list) {
    List<ListOfProduct> discountLists = List<ListOfProduct>();

    for (Datum x in list) {
      for (ListOfProduct y in x.listOfProduct) {
        if (int.parse(y.discount) > 0) {
          discountList.add(y);
        }
      }
    }
    return discountLists;
  }

  ProductItem castToProductItem(
      String id,
      String category,
      String name,
      String price,
      String discount,
      String type,
      String description,
      String image,
      String status,
      String date,
      String updateAt) {
    var productItem = ProductItem();
    productItem.id = id;
    productItem.category = category;
    productItem.name = name;
    productItem.price = price;
    productItem.discount = discount;
    productItem.type = type;
    productItem.description = description;
    productItem.image = image;
    productItem.status = status;
    productItem.date = date;
    productItem.updateAt = updateAt;

    return productItem;
  }
}
