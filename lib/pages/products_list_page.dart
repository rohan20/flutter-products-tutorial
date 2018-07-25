import 'package:flutter/material.dart';

class ProductsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "PRODUCT LIST",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
