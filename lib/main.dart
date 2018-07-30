import 'package:flutter/material.dart';
import 'package:products_tutorial/pages/product_detail_page.dart';
import 'package:products_tutorial/pages/products_list_page.dart';
import 'package:products_tutorial/util/routes.dart';

void main() {
  runApp(
    MaterialApp(
      home: ProductsListPage(),
      routes: Routes.routes,
    ),
  );
}
