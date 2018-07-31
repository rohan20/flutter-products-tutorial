import 'package:products_tutorial/model/any_image.dart';

class Category {
  int id;
  String name;
  int parent;
  String description;
  AnyImage image;
  int count;

  Category(
      {this.id,
      this.name,
      this.parent,
      this.description,
      this.image,
      this.count});
}
