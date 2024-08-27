
class AdminDetails {
  int? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? mobileVerify;
  String? email;
  int? sex;
  int? status;
  String? nationalCode;
  String? image;
  String? createAt;
  String? updateAt;
  int? userCount;
  int? productCount;
  int? orderCount;

  AdminDetails(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobile,
      this.mobileVerify,
      this.email,
      this.sex,
      this.status,
      this.nationalCode,
      this.image,
      this.createAt,
      this.updateAt,
      this.userCount,
      this.productCount,
      this.orderCount});

  AdminDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    mobileVerify = json['mobile_verify'];
    email = json['email'];
    sex = json['sex'];
    status = json['status'];
    nationalCode = json['national_code'];
    image = json['image'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    userCount = json['user_count'];
    productCount = json['product_count'];
    orderCount = json['order_count'];
  }

}