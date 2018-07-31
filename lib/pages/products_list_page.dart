import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:products_tutorial/model/any_image.dart';
import 'package:products_tutorial/model/category.dart';
import 'package:products_tutorial/model/product.dart';
import 'package:products_tutorial/util/remote_config.dart';
import 'package:products_tutorial/widgets/products_list_item.dart';

class ProductsListPage extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "PRODUCT LIST",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: _buildProductsListPage(),
    );
  }

  _buildProductsListPage() {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[100],
      child: FutureBuilder<List<Product>>(
        future: _parseProductsFromResponse(95),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:

            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            case ConnectionState.none:
              return Center(child: Text("Unable to connect right now"));

            case ConnectionState.done:
              return ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    //0th index would contain filter icons
                    return _buildFilterWidgets(screenSize);
                  } else if (index == 7) {
                    return SizedBox(height: 12.0);
                  } else if (index % 2 == 0) {
                    //2nd, 4th, 6th.. index would contain nothing since this would
                    //be handled by the odd indexes where the row contains 2 items
                    return Container();
                  } else {
                    //1st, 3rd, 5th.. index would contain a row containing 2 products
                    return ProductsListItem(
                      product1: snapshot.data[index - 1],
                      product2: snapshot.data[index],
                    );
                  }
                },
              );
          }
        },
      ),
    );
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      width: screenSize.width,
      child: Card(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildFilterButton("SORT"),
              Container(
                color: Colors.black,
                width: 2.0,
                height: 24.0,
              ),
              _buildFilterButton("REFINE"),
            ],
          ),
        ),
      ),
    );
  }

  _buildFilterButton(String title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title),
        ],
      ),
    );
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

  Future<List<Product>> _parseProductsFromResponse(int categoryId) async {
    List<Product> productsList = <Product>[];

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

        productsList.add(product);
      },
    );

    return productsList;
  }
}
