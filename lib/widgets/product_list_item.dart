import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final String name;
  final int currentPrice;
  final int originalPrice;
  final int discount;

  const ProductListItem(
      {Key key,
      this.name,
      this.currentPrice,
      this.originalPrice,
      this.discount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Wrap(
        direction: Axis.vertical,
        children: <Widget>[
          Image.network(
            "https://assets.myntassets.com/h_240,q_90,w_180/v1/assets/images/1304671/2016/4/14/11460624898615-Hancock-Men-Shirts-8481460624898035-1_mini.jpg",
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            "Nakkna",
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
          SizedBox(
            height: 2.0,
          ),
          Row(
            children: <Widget>[
              Text(
                "\$899",
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
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
                "27% Off",
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
