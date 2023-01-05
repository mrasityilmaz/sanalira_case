class BankModel {
  Response? response;
  List<Data>? data;

  BankModel({this.response, this.data});

  BankModel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null ? Response.fromJson(json['response']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  int? code;
  String? message;

  Response({this.code, this.message});

  Response.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class Data {
  String? bankName;
  String? bankIban;
  String? bankAccountName;
  String? descriptionNo;

  Data({this.bankName, this.bankIban, this.bankAccountName, this.descriptionNo});

  Data.fromJson(Map<String, dynamic> json) {
    bankName = json['bankName'];
    bankIban = json['bankIban'];
    bankAccountName = json['bankAccountName'];
    descriptionNo = json['descriptionNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bankName'] = bankName;
    data['bankIban'] = bankIban;
    data['bankAccountName'] = bankAccountName;
    data['descriptionNo'] = descriptionNo;
    return data;
  }
}
