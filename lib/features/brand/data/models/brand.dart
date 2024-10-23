class Brand {
  int id;
  String name;
  String? description;
  String? status;
  String? image;
  String? createdAt;


  Brand({
    required this.id,
    required this.name,
    this.description,
    this.status,
    this.image,
    this.createdAt,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: json['status'],
      image: json['image'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'status': status,
      'image': image,
    };
  }
}