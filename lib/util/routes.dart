import 'package:flutter/material.dart';
import 'package:products_tutorial/pages/product_detail_page.dart';
import 'package:products_tutorial/util/constants.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
//    "/productDetail": (BuildContext context) =>
    Constants.ROUTE_PRODUCT_DETAIL: (BuildContext context) =>
        ProductDetailPage(),
  };
}
