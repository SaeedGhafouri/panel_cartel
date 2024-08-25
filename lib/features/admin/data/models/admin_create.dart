class AdminCreate {
  final String firstName;
  final String lastName;
  final String mobile;
  final String email;
  final int sex;
  final String nationalCode;
  final String? image; // Optional

  AdminCreate({
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.email,
    required this.sex,
    required this.nationalCode,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'mobile': mobile,
      'email': email,
      'sex': sex,
      'national_code': nationalCode,
      'image': image,
    };
  }
}
