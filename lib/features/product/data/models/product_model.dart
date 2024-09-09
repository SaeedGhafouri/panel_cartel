class Product {
  final int id;
  final String name;
  final String barcode;
  final String slug;
  final int status;
  final int brand_id;
  final String brand;
  final int category_id;
  final List<String> category;
  final String image;
  final String description;
  final int is_special;
  final int quantity;
  final String quantity_unit;
  final String salePrice;
  final String price;
  final String imagePath;

  //request
  Product({
    required this.id,
    required this.name,
    required this.barcode,
    required this.slug,
    required this.status,
    required this.brand_id,
    required this.brand,
    required this.category_id,
    required this.category,
    required this.image,
    required this.description,
    required this.is_special,
    required this.quantity,
    required this.quantity_unit,
    required this.salePrice,
    required this.price,
    required this.imagePath,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      barcode: json['barcode'],
      slug: json['slug'],
      status: json['status'],
      brand_id: json['brand_id'],
      brand: json['brand'],
      category_id: json['category_id'],
      category: json['category'],
      image: json['image'],
      description: json['description'],
      is_special: json['is_special'],
      quantity: json['quantity'],
      quantity_unit: json['quantity_unit'],
      salePrice: json['sale_price'],
      price: json['price'],
      imagePath: json['image_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'barcode': barcode,
      'slug': slug,
      'status': status,
      'brand_id': brand_id,
      'brand': brand,
      'category_id': category_id,
      'category': category,
      'image': image,
      'description': description,
      'is_special': is_special,
      'quantity': quantity,
      'quantity_unit': quantity_unit,
      'sale_price': salePrice,
      'price': price,
      'image_path': imagePath,
    };
  }
}