import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import '../helpers/theme_helper.dart';
import '../utils/constants.dart';
import '../view_models/delegate/delegate_modal_view_model.dart';
import 'app_button.dart';

class AddDelegateModal {
  static bottomModalPopup(context) {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      builder: (BuildContext bc) {
        final DelegateModalViewModel viewModel =
            Provider.of<DelegateModalViewModel>(bc);
        return StatefulBuilder(
          builder: (BuildContext context,
              StateSetter setModalState /*You can rename this!*/) {
            // Initially password is obscure
            bool _obscureText = true;

            // Toggles the password show status
            void _toggle() {
              setModalState(() {
                _obscureText = !_obscureText;
              });
            }

            return Container(
              height: size.height * 0.80,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 5.0,
                        width: 50.0,
                        margin: const EdgeInsets.only(bottom: 5.0),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.pop(context, null);
                    //   },
                    //   child: Align(
                    //       alignment: Alignment.centerRight,
                    //       child: Icon(
                    //         Icons.cancel,
                    //         color: kSuccessColor.withOpacity(0.8),
                    //         size: 25.0,
                    //       )),
                    // ),
                    const Text(
                      "Add a new Delegate!",
                      style: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: kNormalText + 3),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Form(
                      //key: _loginViewModel.formKey,
                      child: Column(
                        children: [
                          Container(
                            child: TextFormField(
                              //readOnly: _loginViewModel.loggingIn,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Fullname', 'Enter fullname'),
                              validator: (v) {
                                if (!RequiredValidator(
                                  errorText: 'enter fullname value',
                                ).isValid(v)) {
                                  // viewModel.setError(
                                  //   "User ID",
                                  //   'Enter a valid user ID',
                                  // );
                                } else {
                                  // _loginViewModel
                                  //     .removeError("userId");
                                }
                                return null;
                              },
                              controller: viewModel.fullnameController,
                              keyboardType: TextInputType.text,
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              //readOnly: _loginViewModel.loggingIn,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Email address', 'Enter email address'),
                              validator: (v) {
                                if (!RequiredValidator(
                                  errorText: 'enter valid email address',
                                ).isValid(v)) {
                                  // _loginViewModel.setError(
                                  //   "User ID",
                                  //   'Enter a valid user ID',
                                  // );
                                } else {
                                  // _loginViewModel
                                  //     .removeError("userId");
                                }
                                return null;
                              },
                              controller: viewModel.emailController,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              //readOnly: _loginViewModel.loggingIn,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Username', 'Enter username'),
                              validator: (v) {
                                if (!RequiredValidator(
                                  errorText: 'enter username value',
                                ).isValid(v)) {
                                  // _loginViewModel.setError(
                                  //   "User ID",
                                  //   'Enter a valid user ID',
                                  // );
                                } else {
                                  // _loginViewModel
                                  //     .removeError("userId");
                                }
                                return null;
                              },
                              controller: viewModel.usernameController,
                              keyboardType: TextInputType.text,
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              //readOnly: _loginViewModel.loggingIn,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Bank Name', 'Enter bank name'),
                              validator: (v) {
                                if (!RequiredValidator(
                                  errorText: 'enter bank name value',
                                ).isValid(v)) {
                                  // _loginViewModel.setError(
                                  //   "User ID",
                                  //   'Enter a valid user ID',
                                  // );
                                } else {
                                  // _loginViewModel
                                  //     .removeError("userId");
                                }
                                return null;
                              },
                              controller: viewModel.banknameController,
                              keyboardType: TextInputType.text,
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              //readOnly: _loginViewModel.loggingIn,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Account Number', 'Enter account number'),
                              validator: (v) {
                                if (!RequiredValidator(
                                  errorText: 'enter account number value',
                                ).isValid(v)) {
                                  // _loginViewModel.setError(
                                  //   "User ID",
                                  //   'Enter a valid user ID',
                                  // );
                                } else {
                                  // _loginViewModel
                                  //     .removeError("userId");
                                }
                                return null;
                              },
                              controller: viewModel.acctnumberController,
                              keyboardType: TextInputType.number,
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              //readOnly: _loginViewModel.loggingIn,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Account name', 'Enter account name'),
                              validator: (v) {
                                if (!RequiredValidator(
                                  errorText: 'enter account name value',
                                ).isValid(v)) {
                                  // _loginViewModel.setError(
                                  //   "User ID",
                                  //   'Enter a valid user ID',
                                  // );
                                } else {
                                  // _loginViewModel
                                  //     .removeError("userId");
                                }
                                return null;
                              },
                              controller: viewModel.acctnameController,
                              keyboardType: TextInputType.text,
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              //readOnly: _loginViewModel.loggingIn,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Phone Number', 'Enter phone number'),
                              validator: (v) {
                                if (!RequiredValidator(
                                  errorText: 'enter valid phone number',
                                ).isValid(v)) {
                                  // _loginViewModel.setError(
                                  //   "User ID",
                                  //   'Enter a valid user ID',
                                  // );
                                } else {
                                  // _loginViewModel
                                  //     .removeError("userId");
                                }
                                return null;
                              },
                              controller: viewModel.phoneController,
                              keyboardType: TextInputType.text,
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              //readOnly: _loginViewModel.loggingIn,
                              controller: viewModel.passwordController,
                              obscureText: _obscureText,
                              obscuringCharacter: "*",
                              decoration: ThemeHelper().passwordInputDecoration(
                                'Password',
                                'Enter your password',
                                IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: kPrimaryColor,
                                  ),
                                  onPressed: _toggle,
                                ),
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Enter password';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              //readOnly: _loginViewModel.loggingIn,
                              decoration: ThemeHelper().amountInputDecoration(
                                  'Max Amount Number', '0.00'),
                              validator: (v) {
                                if (!RequiredValidator(
                                  errorText: 'enter valid amount',
                                ).isValid(v)) {
                                  // _loginViewModel.setError(
                                  //   "User ID",
                                  //   'Enter a valid user ID',
                                  // );
                                } else {
                                  // _loginViewModel
                                  //     .removeError("userId");
                                }
                                return null;
                              },
                              controller: viewModel.maxAmountController,
                              keyboardType: TextInputType.number,
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "This amount is the maximum amount a delegate can withdraw from your balance.",
                              style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: kNormalText),
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          AppButton(
                            type: ButtonType.primary,
                            text: "Add Delegate",
                            onPressed: () => viewModel.addDelegate(context),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
