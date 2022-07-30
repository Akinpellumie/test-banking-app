// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

List<dynamic> loginResponseFromJson(String str) => List<dynamic>.from(json.decode(str).map((x) => x));

String loginResponseToJson(List<dynamic> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
