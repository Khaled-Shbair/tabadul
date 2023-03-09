class ProductModel {
  //late String id;
  late String imageOne;
  late String imageTwo;
  late String imageThree;
  late String imageFour;
  late String name;
  late String price;
  late String description;

  ProductModel({
    // required this.id,
    required this.imageOne,
    required this.imageTwo,
    required this.imageThree,
    required this.imageFour,
    required this.name,
    required this.price,
    required this.description,
  });

  ProductModel.fromMap(Map<String, dynamic> map) {
    imageOne = map['image_one'];
    imageTwo = map['image_two'];
    imageThree = map['image_three'];
    imageFour = map['image_four'];
    name = map['name'];
    // id = map['id'];
    price = map['price'];
    description = map['description'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['image_one'] = imageOne;
    map['image_two'] = imageTwo;
    map['image_three'] = imageThree;
    map['image_four'] = imageFour;
    map['name'] = name;
    // map['id'] = id;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}
