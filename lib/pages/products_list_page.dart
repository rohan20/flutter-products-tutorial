import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:products_tutorial/model/any_image.dart';
import 'package:products_tutorial/model/category.dart';
import 'package:products_tutorial/model/product.dart';
import 'package:products_tutorial/scoped_model/product_scoped_model.dart';
import 'package:products_tutorial/util/remote_config.dart';
import 'package:products_tutorial/widgets/products_list_item.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductsListPage extends StatelessWidget {
  BuildContext context;
  ProductScopedModel model;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return ScopedModelDescendant<ProductScopedModel>(
        builder: (context, child, model) {
      this.model = model;
      model.parseProductsFromResponse(95);

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
    });
  }

  _buildProductsListPage() {
    debugPrint("Notify listeners called");

    Size screenSize = MediaQuery.of(context).size;
    return (model.getProductsCount() == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              if (index == 0) {
                //0th index would contain filter icons
                return _buildFilterWidgets(screenSize);
              } else if (index == model.getProductsCount() + 1) {
                return SizedBox(height: 12.0);
              } else if (index % 2 == 0) {
                //2nd, 4th, 6th.. index would contain nothing since this would
                //be handled by the odd indexes where the row contains 2 items
                return Container();
              } else {
                //1st, 3rd, 5th.. index would contain a row containing 2 products
                return ProductsListItem(
                  product1: model.getAllProducts()[index - 1],
                  product2: model.getAllProducts()[index],
                );
              }
            },
          ));
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
}
