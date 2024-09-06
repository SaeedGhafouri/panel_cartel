class Category {
  int id;
  String name;
  String? description;
  String? image;
  int? parentId;
  String? tree;
  int? quantity;
  List<Category> children;
  int childrenCount;

  Category({
    required this.id,
    required this.name,
    this.description,
    this.image,
    this.parentId,
    this.tree,
    this.quantity,
    this.children = const [],
    this.childrenCount = 0,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      parentId: json['parent_id'],
      tree: json['tree'],
      quantity: json['quantity'],
      children: json['children'] != null ? List<Category>.from(json['children'].map((x) => Category.fromJson(x))) : [],
      childrenCount: json['children_count'],
    );
  }
}