import 'package:zaza/models/products_model.dart';

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