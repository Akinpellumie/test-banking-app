// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

List<dynamic> registerResponseFromJson(String str) => List<dynamic>.from(json.decode(str).map((x) => x));

String registerResponseToJson(List<dynamic> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
