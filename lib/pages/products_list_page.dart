import 'package:flutter/material.dart';
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
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildFilterWidgets(screenSize);
          } else {
            return ProductsListItem(
              name: "Nakkana",
              currentPrice: 122,
              originalPrice: 424,
              discount: 23,
              screenSize: screenSize,
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
          padding: const EdgeInsets.all(12.0),
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

  _buildProductsList(Size screenSize) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 2 / 3,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.purple[100 * (index % 9)],
              child: Text("Grid Item: $index"),
            );
          },
        ),
      ),
    );
  }

  _dummyProductsList(Size screenSize) {
    return [
      ProductsListItem(
        name: "Nakkana",
        currentPrice: 122,
        originalPrice: 424,
        discount: 23,
        screenSize: screenSize,
      ),
      ProductsListItem(
        name: "Nakkana",
        currentPrice: 122,
        originalPrice: 424,
        discount: 23,
        screenSize: screenSize,
      ),
      ProductsListItem(
        name: "Nakkana",
        currentPrice: 122,
        originalPrice: 424,
        discount: 23,
      ),
      ProductsListItem(
        name: "Nakkana",
        currentPrice: 122,
        originalPrice: 424,
        discount: 23,
      ),
    ];
  }
}
