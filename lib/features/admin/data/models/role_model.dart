
class Role {
  final int id;
  final String name;
  final String key;
  final String createdAt;
  final String updatedAt;

  Role({
    required this.id,
    required this.name,
    required this.key,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
      key: json['key'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}