class Product {
  final int id;
  final String name;
  final String imagePath;
  final String? oldPrice; // nullable
  final String newPrice;
  final String? discount; // nullable

  Product({
    required this.id,
    required this.name,
    required this.imagePath,
    this.oldPrice,
    required this.newPrice,
    this.discount,
  });

  // Factory to create from map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map["id"],
      name: map["name"],
      imagePath: map["imagePath"],
      oldPrice: (map["oldPrice"] as String).isNotEmpty ? map["oldPrice"] : null,
      newPrice: map["newPrice"],
      discount: (map["discount"] as String).isNotEmpty ? map["discount"] : null,
    );
  }
}
