import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: null,
        ),
        backgroundColor: Colors.white,
        title: Text(
          "PRODUCT DETAIL",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: _buildProductDetailsPage(),
    );
  }

  _buildProductDetailsPage() {}
}
