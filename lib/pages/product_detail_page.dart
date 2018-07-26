import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  final int currentPrice;
  final int originalPrice;
  final int discount;
  final String details;
  final String moreInfo;
  final String styleNote;
  final String materialAndCare;

  const ProductDetailPage(
      {Key key,
      this.name,
      this.currentPrice,
      this.originalPrice,
      this.discount,
      this.details,
      this.moreInfo,
      this.styleNote,
      this.materialAndCare})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "PRODUCT DETAIL",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: _buildProductDetailsPage(context),
    );
  }

  _buildProductDetailsPage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  "https://assets.myntassets.com/h_240,q_90,w_180/v1/assets/images/1304671/2016/4/14/11460624898615-Hancock-Men-Shirts-8481460624898035-1_mini.jpg",
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
//          name,
                  "Nakkana",
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              _buildPriceWidgets(),
              _buildDivider(screenSize),
              _buildFurtherInfoWidget(),
              _buildDivider(screenSize),
            ],
          ),
        ),
      ],
    );
  }

  _buildPriceWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
//              "\$" + currentPrice.toString(),
            "\$899",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
//              "\$" + originalPrice.toString(),
            "\$1299",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
//              discount.toString() + "% Off",
            "30% Off",
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.blue[700],
            ),
          ),
        ],
      ),
    );
  }

  _buildFurtherInfoWidget() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 12.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.local_offer,
                color: Colors.grey[500],
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Tap to get further info",
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 12.0,
        ),
        Container(
          color: Colors.grey[600],
          width: screenSize.width,
          height: 0.25,
        ),
      ],
    );
  }
}
