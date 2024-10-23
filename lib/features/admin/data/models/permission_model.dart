
class Permission {
  final int id;
  final String name;
  final String key;
  final String desc;
  final String category;

  Permission({
    required this.id,
    required this.name,
    required this.key,
    required this.desc,
    required this.category,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      id: json['id'],
      name: json['name'],
      key: json['key'],
      desc: json['desc'],
      category: json['category'],
    );
  }
}