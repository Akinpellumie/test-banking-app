// To parse this JSON data, do
//
//     final plan = planFromJson(jsonString);

import 'package:mobile_banking_app/model/delegate/delegate_fields.dart';

class Delegate {
  Delegate({
    this.id,
    required this.delegateOwner,
    required this.fullname,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.acctname,
    required this.acctnumber,
    required this.bankname,
    required this.maxAmount,
    required this.password,
    required this.createdAt,
  });

  int? id;
  String delegateOwner;
  String fullname;
  String username;
  String email;
  String phoneNumber;
  String acctname;
  String acctnumber;
  String bankname;
  String password;
  String maxAmount;
  DateTime createdAt;

  Delegate copy({
    int? id,
    String? delegateOwner,
    String? fullname,
    String? username,
    String? email,
    String? phoneNumber,
    String? acctname,
    String? acctnumber,
    String? bankname,
    String? password,
    String? maxAmount,
    DateTime? createdAt,
  }) =>
      Delegate(
        id: id ?? this.id,
        delegateOwner: delegateOwner ?? this.delegateOwner,
        fullname: fullname ?? this.fullname,
        username: username ?? this.username,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        acctname: acctname ?? this.acctname,
        acctnumber: acctnumber ?? this.acctnumber,
        bankname: bankname ?? this.bankname,
        password: password ?? this.password,
        maxAmount: maxAmount ?? this.maxAmount,
        createdAt: createdAt ?? this.createdAt,
      );

  // static Delegate fromJson(Map<String, dynamic> json) => Delegate(
  //       id: json["id"] as int?,
  //       fullname: json["fullname"],
  //       username: json["username"],
  //       email: json["email"],
  //       phoneNumber: json["phoneNumber"],
  //       acctname: json["acctname"],
  //       acctnumber: json["acctnumber"],
  //       bankname: json["bankname"],
  //       password: json["password"],
  //       maxAmount: json["maxAmount"],
  //       createdAt: DateTime.parse(json["createdAt"]),
  //     );

  factory Delegate.fromJson(Map<String, dynamic> json) => Delegate(
        id: json["id"] as int?,
        delegateOwner: json["delegateOwner"],
        fullname: json["fullname"],
        username: json["username"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        acctname: json["acctname"],
        acctnumber: json["acctnumber"],
        bankname: json["bankname"],
        password: json["password"],
        maxAmount: json["maxAmount"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        DelegateFields.id: id,
        DelegateFields.delegateOwner: delegateOwner,
        DelegateFields.fullname: fullname,
        DelegateFields.username: username,
        DelegateFields.email: email,
        DelegateFields.phoneNumber: phoneNumber,
        DelegateFields.acctname: acctname,
        DelegateFields.acctnumber: acctnumber,
        DelegateFields.bankname: bankname,
        DelegateFields.password: password,
        DelegateFields.maxAmount: maxAmount,
        DelegateFields.createdAt: createdAt.toIso8601String(),
      };
}
