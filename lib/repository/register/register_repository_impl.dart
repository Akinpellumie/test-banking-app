import 'dart:convert';
import 'package:mobile_banking_app/model/auth/register_response_model.dart';

import '../../config/api_url.dart';
import '../../config/request_helper.dart';
import '../../helpers/tuple.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import 'register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  @override
  Future<Tuple> createAccount(
    String fullname,
    String email,
    String username,
    String acctnumber,
    String acctname,
    String bankname,
    String password,
  ) async {
    try {
      String url = ApiUrl.registerUrl +
          "name=$fullname&username=$username&email=$email&account_number=$acctnumber&account_name=$acctname&bank_name=$bankname&password=$password";
      var data = await RequestHelper.getApi(
        url,
      );
      int status = getHttpStatus(data!.statusCode);
      if (status == 200) {
        //var result = registerResponseFromJson(jsonDecode(data.body));
        return Tuple(response: data.body.toString(), error: null, statusCode: 200);
      } else if (status >= 400 && status <= 409) {
        //var _error = ErrorModel.fromJson(jsonDecode(data.body));
        return Tuple(response: null, error: data, statusCode: 400);
      } else {
        return Tuple(response: null, error: kErrorMessage, statusCode: 500);
      }
    } catch (e) {
      print(e);
      return Tuple(response: null, error: kExceptionMessage, statusCode: 0);
    }
  }
}
