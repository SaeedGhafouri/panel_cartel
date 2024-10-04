
class Admin {
  int? id;
  String? first_name;
  String? last_name;
  String? mobile;
  String? mobileVerify;
  String? email;
  String? password;
  int? sex;
  int? status;
  int? national_code;
  String? telephone;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? userCount;
  int? productCount;
  int? orderCount;

  Admin({
    this.id,
    this.first_name,
    this.last_name,
    this.mobile,
    this.mobileVerify,
    this.email,
    this.password,
    this.sex,
    this.status,
    this.national_code,
    this.telephone,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.userCount,
    this.productCount,
    this.orderCount
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      mobile: json['mobile'],
      mobileVerify: json['mobile_verify'],
      email: json['email'],
      password: json['password'],
      sex: json['sex'],
      status: json['status'],
      national_code: json['national_code'],
      telephone: json['telephone'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
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
      'mobile_verify': mobileVerify,
      'email': email,
      'sex': sex,
      'status': status,
      'national_code': national_code,
      'telephone': telephone,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user_count': userCount,
      'productCount': productCount,
      'orderCount': orderCount,
    };
  }
}
