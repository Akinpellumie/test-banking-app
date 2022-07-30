import 'package:flutter/material.dart';

import '../../config/request_helper.dart';
import '../../helpers/tuple.dart';
import '../../repository/login/login_repository_impl.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import '../../utils/snackbar_content_type.dart';

class LoginViewModel extends ChangeNotifier {
  static late TextEditingController _usernameController;
  static late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_loginFormKey');
  final LoginRepositoryImpl _authRepoImpl = LoginRepositoryImpl();
  bool _loggingIn = false;

  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get formKey => _formKey;
  bool get loggingIn => _loggingIn;

  final Map<String, dynamic> _errorBag = {};

  LoginViewModel() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    //setUserIdValue();
  }

  // static Future<String> getUserIdValue() async {
  //   return await UserPreferences.getUsername();
  // }

  Map get errorBag => _errorBag;

  void setError(String key, String value) {
    _errorBag[key] = value;
    notifyListeners();
  }

  void removeError(String key) {
    _errorBag.remove(key);
    notifyListeners();
  }

  void _toggleLoggingIn(bool value) {
    _loggingIn = value;
    notifyListeners();
  }

  void loginUser(BuildContext context) async {
    try {
      final form = _formKey.currentState;
      if (usernameController.text.isEmpty) {
        displayToast("Enter a valid username", kPrimaryColor);
      } else if (passwordController.text.isEmpty) {
        displayToast("Enter a valid password", kPrimaryColor);
      } else if (form!.validate() && _errorBag.keys.isEmpty) {
        _toggleLoggingIn(true);
        Tuple result = await _authRepoImpl.login(_usernameController.text,_passwordController.text);

        _toggleLoggingIn(false);
        if (result.response != null && result.statusCode == 200) {
          //print(json.encode(user.toJson()));
          RequestHelper.userToken = result.response.message.token;
          //gotoMainScreen(context, '/main');
          _passwordController.text = "";
        } else if (result.statusCode != 200 || result.error != null) {
          //showsnackbar(context, result.error, SnackbarContentType.failure);
        }
        else {
        //print(_errorBag);
        //showsnackbar(
            // context,
            // "Something went wrong while verifying you or maybe we're out of reach. Please check back later or contact support.",
            // SnackbarContentType.failure);
      }
      } else {
        print(_errorBag);
        //showsnackbar(
            // context,
            // "Oops! Seems something is off. Please check back later or contact support.",
            // SnackbarContentType.failure);
      }
    } on Exception catch (e) {
      print(e);
      //showsnackbar(
          // context,
          // "An unkwown error occured. Please check back later or contact support.",
          // SnackbarContentType.failure);
    } finally {
      _toggleLoggingIn(false);
    }
  }

  @override
  void dispose() {
    print("Disposed");
    //_userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
