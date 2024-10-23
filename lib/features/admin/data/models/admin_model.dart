class Admin {
  final int? id;
  final String? first_name;
  final String? last_name;
  final String? mobile;
  final String? mobile_verify;
  final String? email;
  final String? email_verify;
  final String? password;
  final int? sex;
  final int? status;
  final int? national_code;
  final String? telephone;
  final String? image;
  final String? created_at;
  final String? updated_at;
  final int? userCount;
  final int? productCount;
  final int? orderCount;
  final int? role_id;
  final String? role_name;

  Admin({
    this.id,
    this.first_name,
    this.last_name,
    this.mobile,
    this.mobile_verify,
    this.email,
    this.email_verify,
    this.password,
    this.sex,
    this.status,
    this.national_code,
    this.telephone,
    this.image,
    this.created_at,
    this.updated_at,
    this.userCount,
    this.productCount,
    this.orderCount,
    this.role_id,
    this.role_name,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      mobile: json['mobile'],
      mobile_verify: json['mobile_verify'],
      email: json['email'],
      email_verify: json['email_verify'],
      sex: json['sex'],
      status: json['status'],
      national_code: json['national_code'],
      telephone: json['telephone'],
      image: json['image'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      userCount: json['user_count'],
      productCount: json['product_count'],
      orderCount: json['order_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'password': password,
      'mobile': mobile,
      'mobile_verify': mobile_verify,
      'email': email,
      'email_verify': email_verify,
      'sex': sex,
      'status': status,
      'national_code': national_code,
      'telephone': telephone,
      'image': image,
      'created_at': created_at,
      'updated_at': updated_at,
      'user_count': userCount,
      'product_count': productCount,
      'order_count': orderCount,
      'role_id': role_id,
      'role_name': role_name,
    };
  }
}
