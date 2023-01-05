class UserModel {
  String? nameSurname;
  String? password;
  String? email;
  String? phoneNumber;

  UserModel({required this.nameSurname, required this.password, required this.email, required this.phoneNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    nameSurname = json['nameSurname'];
    password = json['password'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nameSurname'] = nameSurname;
    data['password'] = password;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
