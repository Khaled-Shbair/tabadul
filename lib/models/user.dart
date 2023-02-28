class User {
  late String id;
  late String firstName;
  late String lastName;
  late String city;
  late String street;
  late String image;
  late String phone;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.street,
    required this.image,
    required this.phone,
  });

  User.fromMap(Map<String, dynamic> map) {
    firstName = map['first_name'];
    lastName = map['last_name'];
    city = map['city'];
    street = map['street'];
    image = map['image'];
    id = map['id'];
    phone = map['phone'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['city'] = city;
    map['street'] = street;
    map['image'] = image;
    map['id'] = id;
    map['phone'] = phone;
    return map;
  }
}
