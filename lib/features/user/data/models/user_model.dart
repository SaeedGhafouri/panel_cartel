class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? mobile;
  final String? mobileVerify;
  final String? email;
  final int? sex;
  final String? status;
  final int? nationalCode;
  final String? role;
  final String? image;
  final String? createAt;
  final String? updateAt;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.mobile,
    this.mobileVerify,
    this.email,
    this.sex,
    this.status,
    this.nationalCode,
    this.role,
    this.image,
    this.createAt,
    this.updateAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      mobile: json['mobile'],
      mobileVerify: json['mobile_verify'],
      email: json['email'],
      sex: json['sex'],
      status: json['status'],
      nationalCode: json['national_code'],
      role: json['role'],
      image: json['image'],
      createAt: json['create_at'],
      updateAt: json['update_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'mobile': mobile,
      'mobile_verify': mobileVerify,
      'email': email,
      'sex': sex,
      'status': status,
      'national_code': nationalCode,
      'role': role,
      'image': image,
      'create_at': createAt,
      'update_at': updateAt,
    };
  }

}