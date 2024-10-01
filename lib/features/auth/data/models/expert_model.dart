class Expert {
  int? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? email;
  int? sex;
  int? nationalCode;
  String? image;

  Expert(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.sex,
      this.nationalCode,
      this.image});

  Expert.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    sex = json['sex'];
    nationalCode = json['national_code'];
    image = json['image'];
  }

}