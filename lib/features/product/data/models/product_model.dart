class Product {
  final int? id;
  final String? name;
  final String? barcode;
  final String? slug;
  final String? status;
  final int? brand_id;
  final String? brand;
  final String? category_id;
  final List<dynamic>? category;
  final String? description;
  final int? is_special;
  final int? quantity;
  final String? quantity_unit;
  final int? salePrice;
  final int? price;
  final String? image;
  final List<dynamic?>? gallery;

  Product({
    required this.id,
    required this.name,
    required this.barcode,
    required this.slug,
    required this.status,
    this.brand_id,
    this.brand,
    this.category_id,
    this.category,
    this.description,
    required this.is_special,
    required this.quantity,
    required this.quantity_unit,
    required this.salePrice,
    required this.price,
    this.image,
    this.gallery,
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
      description: json['description'],
      is_special: json['is_special'],
      quantity: json['quantity'],
      quantity_unit: json['quantity_unit'],
      salePrice: json['sale_price'],
      price: json['price'],
      image: json['image'],
      gallery: json['gallery'],
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
      'description': description,
      'is_special': is_special,
      'quantity': quantity,
      'quantity_unit': quantity_unit,
      'sale_price': salePrice,
      'price': price,
      'image': image,
      'gallery': gallery,
    };
  }
}