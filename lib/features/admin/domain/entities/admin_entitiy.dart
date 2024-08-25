class AdminEntity {
  final double id;
  final String first_name;
  final String last_name;
  final String mobile;
  final String mobile_verify;
  final String email;
  final String sex;
  final int status;
  final String national_code;
  final String image;

  AdminEntity({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.mobile,
    required this.mobile_verify,
    required this.email,
    required this.sex,
    required this.status,
    required this.national_code,
    required this.image,
  });
}