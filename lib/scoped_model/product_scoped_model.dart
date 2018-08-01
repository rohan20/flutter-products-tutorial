import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:products_tutorial/model/any_image.dart';
import 'package:products_tutorial/model/category.dart';

import 'package:products_tutorial/model/product.dart';
import 'package:products_tutorial/util/remote_config.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductScopedModel extends Model {
  List<Product> _productsList = [];

  void addToProductsList(Product product) {
    _productsList.add(product);
    notifyListeners();
  }

  void removeFromProductsList(Product product) {
    if (_productsList.contains(product)) {
      _productsList.remove(product);
      notifyListeners();
    }
  }

  List<Product> getAllProducts() {
    return _productsList;
  }

  int getProductsCount() {
    return _productsList.length;
  }

  Future<dynamic> _getProductsByCategory(categoryId, pageIndex) async {
    var response = await http.get(
      RemoteConfig.config["BASE_URL"] +
          RemoteConfig.config["BASE_PRODUCTS_URL"] +
          "&category=$categoryId&per_page=6&page=$pageIndex",
      headers: {
        "Authorization": RemoteConfig.config["AuthorizationToken"],
      },
    ).catchError(
      (error) {
        return false;
      },
    );

    return json.decode(response.body);
  }

  Future parseProductsFromResponse(int categoryId) async {
    var dataFromResponse = await _getProductsByCategory(categoryId, 1);

    dataFromResponse.forEach(
      (newProduct) {
        //parse the product's images
        List<AnyImage> imagesOfProductList = [];

        newProduct["images"].forEach(
          (newImage) {
            imagesOfProductList.add(
              new AnyImage(
                imageURL: newImage["src"],
                id: newImage["id"],
                title: newImage["name"],
                alt: newImage["alt"],
              ),
            );
          },
        );

        //parse the product's categories
        List<Category> categoriesOfProductList = [];

        newProduct["categories"].forEach(
          (newCategory) {
            categoriesOfProductList.add(
              new Category(
                id: newCategory["id"],
                name: newCategory["name"],
              ),
            );
          },
        );

        //parse new product's details
        Product product = new Product(
          productId: newProduct["id"],
          productName: newProduct["name"],
          description: newProduct["description"],
          regularPrice: newProduct["regular_price"],
          salePrice: newProduct["sale_price"],
          stockQuantity: newProduct["stock_quantity"] != null
              ? newProduct["stock_quantity"]
              : 0,
          ifItemAvailable: newProduct["on_sale"] &&
              newProduct["purchasable"] &&
              newProduct["in_stock"],
          discount: ((((int.parse(newProduct["regular_price"]) -
                          int.parse(newProduct["sale_price"])) /
                      (int.parse(newProduct["regular_price"]))) *
                  100))
              .round(),
          images: imagesOfProductList,
          categories: categoriesOfProductList,
        );

        addToProductsList(product);
      },
    );

    notifyListeners();
  }
}
