class Product {
  final int id;
  final String name;
  final String barcode;
  final int salePrice;
  final int price;
  final String imagePath;
  final String status;
  final String brand;
  final List<String> category;
  final int quantity;
  final String? details;

  Product({
    required this.id,
    required this.name,
    required this.barcode,
    required this.salePrice,
    required this.price,
    required this.imagePath,
    required this.status,
    required this.brand,
    required this.category,
    required this.quantity,
    this.details,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      barcode: json['barcode'],
      salePrice: json['sale_price'],
      price: json['price'],
      imagePath: json['image_path'],
      status: json['status'],
      brand: json['brand'],
      category: List<String>.from(json['category']),
      quantity:json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'barcode': barcode,
      'sale_price': salePrice,
      'price': price,
      'image_path': imagePath,
      'status': status,
      'brand': brand,
      'category': category,
      'quantity': quantity,
    };
  }
}