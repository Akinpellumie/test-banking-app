
import 'dart:io';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';
import '../utils/helpers.dart';
import 'api_url.dart';

class RequestHelper {
  //static String token = UserPreferences.getToken();
  //save user token in constant
  static String userToken = "";
  // static String userID = "";
  // static String cusCurrentCaller = "";
  // static String userFullname = "";
  // static String userEmail = "";

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static Map<String, String> headerWithAuth = {
    'Content-Type': 'application/json',
    'Authorization': userToken
  };
  static Future<http.Response?> postApi(String url, dynamic data) async {
    try {
      var res = await http.post(Uri.parse(url),
          headers: url == ApiUrl.loginUrl ? headers : headerWithAuth,
          body: data);
      //int status = getHttpStatus(res.statusCode);
      if (res.statusCode == 200) {
        return res;
      } else if (res.statusCode == 401) {
        return res;
      } else if (res.statusCode == 400 && url == ApiUrl.loginUrl) {
        return res;
      } else {
        return res;
      }
    } on Exception catch (e) {
      print(e);
      displayToast("An error occurred", kRedColor);
      return null;
    }
  }

  static Future<http.Response?> getApi(String url) async {
    try {
      var res = await http.get(Uri.parse(url),
          headers: url == ApiUrl.loginUrl ? headers : headerWithAuth);
      if (res.statusCode == HttpStatus.ok) {
        return res;
      } else {
        displayToast(res.reasonPhrase!, kRedColor);
      }
    } on Exception catch (e) {
      print(e);
      displayToast("An error occurred", kRedColor);
      return null;
    }
    return null;
  }
}
