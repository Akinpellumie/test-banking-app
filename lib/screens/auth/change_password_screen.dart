import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../helpers/theme_helper.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import '../../utils/security_tip_modal.dart';
import '../../utils/snackbar_content_type.dart';
import '../../widgets/app_button.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/custom_snackbar.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      SecurityTipModal.securityTipPopup(
        context,
        'SECURITY TIPS',
        'Make sure to use different user IDs and passwords for your financial accounts and for any other sites you use online. Never reveal your password to anyone or leave your password anywhere that someone else can obtain and use it. Change your password on a regular basis.',
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 0.0,
              top: -20.0,
              child: Opacity(
                opacity: 0.08,
                child: SvgPicture.asset(
                  "assets/images/floating.svg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      right: 16.0,
                      left: 16.0,
                      top: 15.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomBackButton(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Change Password",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          "Stay in-charge of your account anywhere, anytime!",
                          style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: FontWeight.normal,
                              fontSize: kNormalText - 3),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 100.0,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 10.0),
                          Form(
                            //key: _loginViewModel.formKey,
                            child: Column(
                              children: [
                                Container(
                                  child: TextFormField(
                                    //readOnly: _loginViewModel.loggingIn,
                                    // controller:
                                    //     _loginViewModel.passwordController,
                                    obscureText: _obscureText,
                                    obscuringCharacter: "*",
                                    decoration:
                                        ThemeHelper().passwordInputDecoration(
                                      'Current Password',
                                      'Enter current password',
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
                                    validator: (v) {
                                      if (!RequiredValidator(
                                        errorText: '',
                                      ).isValid(v)) {
                                        // _loginViewModel.setError(
                                        //   "Password",
                                        //   'Enter a valid password',
                                        // );
                                      } else {
                                        // _loginViewModel
                                        //     .removeError("password");
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                  child: TextFormField(
                                    //readOnly: _loginViewModel.loggingIn,
                                    // controller:
                                    //     _loginViewModel.passwordController,
                                    obscureText: _obscureText,
                                    obscuringCharacter: "*",
                                    decoration:
                                        ThemeHelper().passwordInputDecoration(
                                      'New Password',
                                      'Enter new password',
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
                                    validator: (v) {
                                      if (!RequiredValidator(
                                        errorText: '',
                                      ).isValid(v)) {
                                        // _loginViewModel.setError(
                                        //   "Password",
                                        //   'Enter a valid password',
                                        // );
                                      } else {
                                        // _loginViewModel
                                        //     .removeError("password");
                                      }
                                      return null;
                                    },
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(height: 20.0),
                                AppButton(
                                  type: ButtonType.primary,
                                  text: "Submit",
                                  onPressed: () {
                                    displayToast('Password change successfully',
                                        kPrimaryColor);
                                    nextScreen(context, "/");
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
