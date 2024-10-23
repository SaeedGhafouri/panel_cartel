class User {
  final int? id;
  final String? first_name;
  final String? last_name;
  final String? mobile;
  final String? mobile_verify;
  final String? email;
  final String? email_verify;
  final String? password;
  final int? sex;
  final String? status;
  final int? national_code;
  final int? economic_code;
  final String? telephone;
  final String? image;
  final String? created_at;
  final String? updated_at;

  User({
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
    this.economic_code,
    this.telephone,
    this.image,
    this.created_at,
    this.updated_at,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
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
      economic_code: json['economic_code'],
      telephone: json['telephone'],
      image: json['image'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'mobile': mobile,
      'mobile_verify': mobile_verify,
      'email': email,
      'email_verify': email_verify,
      'sex': sex,
      'status': status,
      'national_code': national_code,
      'economic_code': economic_code,
      'telephone' : telephone,
      'image': image,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

}