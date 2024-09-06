class Product {
  final int? id;
  final String? name;
  final String? barcode;
  final String? slug;
  final int? status;
  final int? brand_id;
  final String? brand;
  final int? category_id;
  final List<String>? category;
  final String? image;
  final String? description;
  final int? is_special;
  final int? quantity;
  final String? quantity_unit;
  final String? salePrice;
  final String? price;
  final String? imagePath;

  Product(this.id, this.name, this.barcode, this.slug, this.status, this.brand_id, this.brand, this.category_id, this.category, this.image, this.description, this.is_special, this.quantity, this.quantity_unit, this.salePrice, this.price, this.imagePath);


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['id'],
      json['name'],
      json['barcode'],
      json['slug'],
      json['status'],
      json['brand_id'],
      json['brand'],
      json['category_id'],
      json['category'],
      json['image'],
      json['description'],
      json['is_special'],
      json['quantity'],
      json['quantity_unit'],
      json['sale_price'],
     json['price'],
      json['image_path'],
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