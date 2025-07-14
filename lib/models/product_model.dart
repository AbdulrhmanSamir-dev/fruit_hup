class ProductModel {
  final String id;
  final String name;
  final String image;
  final double price;
  final List<String> category;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map, String docId) {
    return ProductModel(
      id: docId,
      name: map['name'] ?? '',
      image: map['image'] ?? 'assets/fruitHupPics/item-removebg-preview.png',
      price: (map['price'] ?? 0).toDouble(),
      category: List<String>.from(map['category']),
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'price': price, 'image': image, 'category': category};
  }
}
