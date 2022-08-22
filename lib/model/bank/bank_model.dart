import 'dart:convert';

BankModel bankModelFromJson(String str) => BankModel.fromJson(json.decode(str));

String bankModelToJson(BankModel data) => json.encode(data.toJson());

class BankModel {
  BankModel({
    required this.bankCode,
    required this.bankName,
  });

  String bankCode;
  String bankName;

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
        bankCode: json["bankCode"],
        bankName: json["bankName"],
      );

  Map<String, dynamic> toJson() => {
        "bankCode": bankCode,
        "bankName": bankName,
      };
}
