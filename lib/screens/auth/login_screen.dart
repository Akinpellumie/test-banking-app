import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_banking_app/utils/security_tip_modal.dart';
import 'package:provider/provider.dart';

import '../../helpers/theme_helper.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import '../../view_models/auth/login_view_model.dart';
import '../../widgets/app_button.dart';
import '../../widgets/custom_back_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    LoginViewModel _loginViewModel = context.watch<LoginViewModel>();
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 15.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomBackButton(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Log in to your account",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "This is the first version of our E-Banking app. Please sign in or create an account below.",
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 180.0,
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
                          const SizedBox(height: 15.0),
                          Form(
                            key: _loginViewModel.formKey,
                            child: Column(
                              children: [
                                Container(
                                  child: TextFormField(
                                    readOnly: _loginViewModel.loggingIn,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            'Username', 'Enter valid username'),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Enter username';
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller:
                                        _loginViewModel.usernameController,
                                    keyboardType: TextInputType.text,
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(height: 40.0),
                                Container(
                                  child: TextFormField(
                                    readOnly: _loginViewModel.loggingIn,
                                    controller:
                                        _loginViewModel.passwordController,
                                    obscureText: _obscureText,
                                    obscuringCharacter: "*",
                                    decoration:
                                        ThemeHelper().passwordInputDecoration(
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
                                const SizedBox(
                                  height: 50.0,
                                ),
                                AppButton(
                                  type: ButtonType.primary,
                                  text: "Log In",
                                  loading: _loginViewModel.loggingIn,
                                  onPressed: () {
                                    _loginViewModel.loginUser(context);
                                    //nextScreen(context, "/home");
                                  },
                                  // onPressed: () {},
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        "Don't have an account? ",
                                        style: TextStyle(
                                          color: kTextColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          nextScreen(context, "/register");
                                        },
                                        child: const Text(
                                          "Register!",
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
