import 'package:flutter/material.dart';

import '../../helpers/tuple.dart';
import '../../repository/register/register_repository_impl.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';

class SendMoneyViewModel extends ChangeNotifier {
  static late TextEditingController _usernameController;
  static late TextEditingController _passwordController;
  static late TextEditingController _emailController;
  static late TextEditingController _fullnameController;
  static late TextEditingController _acctnumberController;
  static late TextEditingController _acctnameController;
  static late TextEditingController _banknameController;
  final GlobalKey<FormState> _registerFormKey =
      GlobalKey<FormState>(debugLabel: '_registerFormKey');
  final RegisterRepositoryImpl _registerRepoImpl = RegisterRepositoryImpl();
  bool _creatingAcct = false;

  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get fullnameController => _fullnameController;
  TextEditingController get acctnumberController => _acctnumberController;
  TextEditingController get acctnameController => _acctnameController;
  TextEditingController get banknameController => _banknameController;
  TextEditingController get emailController => _emailController;
  GlobalKey<FormState> get registerFormKey => _registerFormKey;
  bool get creatingAcct => _creatingAcct;

  final Map<String, dynamic> _errorBag = {};

  SendMoneyViewModel() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    _fullnameController = TextEditingController();
    _acctnameController = TextEditingController();
    _acctnumberController = TextEditingController();
    _banknameController = TextEditingController();
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

  void _toggleCreatingAcct(bool value) {
    _creatingAcct = value;
    notifyListeners();
  }

  void registerUser(BuildContext context) async {
    try {
      //final form = _formKey.currentState;
      if (_registerFormKey.currentState!.validate()) {
        _toggleCreatingAcct(true);
        Tuple result = await _registerRepoImpl.createAccount(
          _fullnameController.text,
          _emailController.text,
          _usernameController.text,
          _acctnumberController.text,
          _acctnameController.text,
          _banknameController.text,
          _passwordController.text,
        );

        _toggleCreatingAcct(false);
        if (result.response != null && result.statusCode == 200) {
          //List<dynamic> res = result.response as List<dynamic>;
          String response = result.response;
          if (response.isNotEmpty && response.contains("true")) {
            displayToast("Account created successfully. Proceed to Login",
                kPrimaryColor);
            _fullnameController.text = '';
            _usernameController.text = '';
            _emailController.text = '';
            _acctnameController.text = '';
            _acctnumberController.text = '';
            _banknameController.text = '';
            _passwordController.text = '';
            Navigator.pop(context);
          } else {
            var str = response.split(',');
            print(str);
            displayToast(response[1], kPrimaryColor);
            return;
          }
        } else if (result.statusCode == 200 || result.response == null) {
          displayToast(
              "Invalid credentials provided. Please check and try again.",
              kRedColor);
        } else if (result.statusCode != 200 || result.error != null) {
          displayToast(
              "An error occured. Please contact support or try again later.",
              kRedColor);
        } else {
          displayToast(
              "Something went wrong while creating your account or maybe we're out of reach. Please check back later or contact support.",
              kRedColor);
        }
      } else {
        displayToast("Kindly fill all required credentials", kRedColor);
      }
    } on Exception catch (e) {
      print(e);
    } finally {
      _toggleCreatingAcct(false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    print("Disposed");
    _fullnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _acctnameController.dispose();
    _acctnumberController.dispose();
    _banknameController.dispose();
    _passwordController.dispose();
  }
}
