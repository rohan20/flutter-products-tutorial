import 'package:flutter/material.dart';
import 'package:products_tutorial/pages/product_detail_page.dart';
import 'package:products_tutorial/pages/products_list_page.dart';
import 'package:products_tutorial/scoped_model/product_scoped_model.dart';
import 'package:products_tutorial/util/routes.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(
    ScopedModel<ProductScopedModel>(
      model: ProductScopedModel(),
      child: MaterialApp(
        home: ProductsListPage(),
        routes: Routes.routes,
      ),
    ),
  );
}
