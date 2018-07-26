import 'package:flutter/material.dart';

class ProductsListItem extends StatelessWidget {
  final String name;
  final int currentPrice;
  final int originalPrice;
  final int discount;
  final Size screenSize;

  const ProductsListItem(
      {Key key,
      this.name,
      this.currentPrice,
      this.originalPrice,
      this.discount,
      this.screenSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            "https://assets.myntassets.com/h_240,q_90,w_180/v1/assets/images/1304671/2016/4/14/11460624898615-Hancock-Men-Shirts-8481460624898035-1_mini.jpg",
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "\$" + currentPrice.toString(),
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      "\$" + originalPrice.toString(),
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
                      discount.toString() + "% Off",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
