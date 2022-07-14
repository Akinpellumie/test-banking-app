// To parse this JSON data, do
//
//     final plan = planFromJson(jsonString);


class DelegateModel {
  DelegateModel(
      {
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.maxAmount});

  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String maxAmount;

  factory DelegateModel.fromJson(Map<String, dynamic> json) => DelegateModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        maxAmount: json["maxAmount"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "maxAmount": maxAmount,
      };
}
