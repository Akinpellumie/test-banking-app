import 'package:flutter/material.dart';
import 'package:mobile_banking_app/utils/constants.dart';
import 'package:mobile_banking_app/utils/shared_prefs.dart';

import '../../model/delegate/delegate.dart';
import '../../utils/helpers.dart';

class DelegateModalViewModel extends ChangeNotifier {
  static late TextEditingController _fullnameController;
  static late TextEditingController _usernameController;
  static late TextEditingController _emailController;
  static late TextEditingController _phoneController;
  static late TextEditingController _acctnameController;
  static late TextEditingController _acctnumberController;
  static late TextEditingController _banknameController;
  static late TextEditingController _passwordController;
  static late TextEditingController _maxAmountController;
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_delegateFormKey');
  //inal AuthRepositoryImpl _authRepoImpl = AuthRepositoryImpl();
  bool _loggingIn = false;

  TextEditingController get fullnameController => _fullnameController;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get acctnameController => _acctnameController;
  TextEditingController get acctnumberController => _acctnumberController;
  TextEditingController get banknameController => _banknameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get maxAmountController => _maxAmountController;
  GlobalKey<FormState> get formKey => _formKey;

  final Map<String, dynamic> _errorBag = {};

  DelegateModalViewModel() {
    _fullnameController = TextEditingController();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _acctnameController = TextEditingController();
    _acctnumberController = TextEditingController();
    _banknameController = TextEditingController();
    _passwordController = TextEditingController();
    _maxAmountController = TextEditingController();
    //setUserIdValue();
  }

  void addDelegate(BuildContext context) async {
    try {
      final form = _formKey.currentState;
      if (fullnameController.text.isEmpty ||
          usernameController.text.isEmpty ||
          emailController.text.isEmpty ||
          phoneController.text.isEmpty ||
          acctnameController.text.isEmpty ||
          acctnumberController.text.isEmpty ||
          banknameController.text.isEmpty ||
          passwordController.text.isEmpty ||
          maxAmountController.text.isEmpty) {
        displayToast("Enter all required details", kRedColor);
      } else {
        String userId = await SharedPrefs.getString('userID');
        var model = Delegate(
          delegateOwner: userId,
          fullname: _fullnameController.text,
          username: _usernameController.text,
          email: _emailController.text,
          phoneNumber: _phoneController.text,
          acctname: _acctnameController.text,
          acctnumber: _acctnumberController.text,
          bankname: _banknameController.text,
          password: _passwordController.text,
          maxAmount: _maxAmountController.text,
          createdAt: DateTime.now(),
        );
        Navigator.pop(context, model);
      }
    } on Exception catch (e) {
      print(e);
    } finally {
      _fullnameController.text = '';
      _usernameController.text = '';
      _emailController.text = '';
      _phoneController.text = '';
      _acctnameController.text = '';
      _acctnumberController.text = '';
      _banknameController.text = '';
      _passwordController.text = '';
      _maxAmountController.text = '';
    }
  }

  @override
  void dispose() {
    print("Disposed");
    //_userIdController.dispose();
    _fullnameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _acctnameController.dispose();
    _acctnumberController.dispose();
    _banknameController.dispose();
    _passwordController.dispose();
    _maxAmountController.dispose();
    super.dispose();
  }
}
