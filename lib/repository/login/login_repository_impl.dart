import 'dart:convert';

import 'package:mobile_banking_app/model/auth/login_response_model.dart';

import '../../config/api_url.dart';
import '../../config/request_helper.dart';
import '../../helpers/tuple.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<Tuple> login(String username, String password) async {
    try {
      String url = ApiUrl.loginUrl + "username=$username&password=$password";
      var data = await RequestHelper.getApi(url);
      int status = getHttpStatus(data!.statusCode);
      if (status == 200) {
        return Tuple(response: data.body, error: null, statusCode: 200);
      } else if (status >= 400 && status <= 409) {
        //var _error = ErrorModel.fromJson(jsonDecode(data.body));
        return Tuple(response: null, error: data, statusCode: data.statusCode);
      } else {
        return Tuple(response: null, error: kErrorMessage, statusCode: 500);
      }
    } catch (e) {
      print(e);
      return Tuple(response: null, error: kExceptionMessage, statusCode: 0);
    }
  }
}
