class Admin {
  final int id;
  final String firstName;
  final String lastName;
  final String mobile;
  final String? mobileVerify;
  final String email;
  final int sex;
  final int status;
  final String nationalCode;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  Admin({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    this.mobileVerify,
    required this.email,
    required this.sex,
    required this.status,
    required this.nationalCode,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      mobile: json['mobile'],
      mobileVerify: json['mobile_verify'],
      email: json['email'],
      sex: json['sex'],
      status: json['status'],
      nationalCode: json['national_code'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
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
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
