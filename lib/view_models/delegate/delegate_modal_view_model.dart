import 'package:flutter/material.dart';
import 'package:mobile_banking_app/utils/constants.dart';

import '../../model/delegate/delegate_model.dart';
import '../../utils/helpers.dart';

class DelegateModalViewModel extends ChangeNotifier {
  static late TextEditingController _firstNameController;
  static late TextEditingController _lastNameController;
  static late TextEditingController _emailController;
  static late TextEditingController _phoneController;
  static late TextEditingController _maxAmountController;
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: '_delegateFormKey');
  //inal AuthRepositoryImpl _authRepoImpl = AuthRepositoryImpl();
  bool _loggingIn = false;

  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get maxAmountController => _maxAmountController;
  GlobalKey<FormState> get formKey => _formKey;

  final Map<String, dynamic> _errorBag = {};

  DelegateModalViewModel() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _maxAmountController = TextEditingController();
    //setUserIdValue();
  }

  void addDelegate(BuildContext context) async {
    try {
      final form = _formKey.currentState;
      if (firstNameController.text.isEmpty ||
          lastNameController.text.isEmpty ||
          emailController.text.isEmpty ||
          phoneController.text.isEmpty ||
          maxAmountController.text.isEmpty) {
        displayToast("Enter all required details", kRedColor);
      } else {
        var model = DelegateModel(
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            email: _emailController.text,
            phoneNumber: _phoneController.text,
            maxAmount: _maxAmountController.text);
        Navigator.pop(context, model);
      }
    } on Exception catch (e) {
      print(e);
    } finally {}
  }

  @override
  void dispose() {
    print("Disposed");
    //_userIdController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _maxAmountController.dispose();
    super.dispose();
  }
}
