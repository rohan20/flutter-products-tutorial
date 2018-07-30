import 'package:products_tutorial/model/any_image.dart';
import 'package:products_tutorial/model/category.dart';

class Product {
  String lineItemId;
  int productId;
  String productName;
  List<Category> categories;
  List<AnyImage> images;
  List<String> size;
  String shortDescription;
  String regularPrice;
  String salePrice;
  int discount;
  bool ifItemAvailable;
  bool ifAddedToCart;
  String description;
  int stockQuantity;
  int quantity;

  Product(
      {this.lineItemId,
      this.productId,
      this.productName,
      this.categories,
      this.images,
      this.size,
      this.shortDescription,
      this.regularPrice,
      this.salePrice,
      this.discount,
      this.ifItemAvailable,
      this.ifAddedToCart,
      this.description,
      this.stockQuantity,
      this.quantity});

  @override
  toString() => "productId: $productId , productName: $productName";

}
