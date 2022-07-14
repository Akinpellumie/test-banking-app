import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mobile_banking_app/model/delegate/delegate_model.dart';
import 'package:mobile_banking_app/utils/snackbar_content_type.dart';
import 'package:mobile_banking_app/widgets/add_delegate_modal.dart';
import 'package:mobile_banking_app/widgets/custom_snackbar.dart';

import '../../helpers/theme_helper.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import '../../widgets/app_button.dart';
import '../../widgets/custom_back_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Initially password is obscure
  bool _obscureText = true;
  String firstDelegate = '';
  String secondDelegate = '';
  String thirdDelegate = '';
  late DelegateModel? firstDelegateData;
  late DelegateModel? secondDelegateData;
  late DelegateModel? thirdDelegateData;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _showsnackbar() {
    var snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: CustomSnackbar(
        title: 'SECURITY TIPS',
        message:
            'Using a strong password (one that is not easily guessed by a human or computer) will have eight or more characters, including letters, numbers and symbols!',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: SnackbarContentType.success,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
    _showsnackbar();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          "Let's get started",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Please enter your basic informations to get started.",
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
                            //key: _loginViewModel.formKey,
                            child: Column(
                              children: [
                                Container(
                                  child: TextFormField(
                                    //readOnly: _loginViewModel.loggingIn,
                                    decoration: ThemeHelper()
                                        .textInputDecoration('First Name',
                                            'Enter your first name'),
                                    validator: (v) {
                                      if (!RequiredValidator(
                                        errorText: '',
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
                                    // controller:
                                    //     _loginViewModel.userIdController,
                                    keyboardType: TextInputType.text,
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                  child: TextFormField(
                                    //readOnly: _loginViewModel.loggingIn,
                                    decoration: ThemeHelper()
                                        .textInputDecoration('Last Name',
                                            'Enter your last name'),
                                    validator: (v) {
                                      if (!RequiredValidator(
                                        errorText: '',
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
                                    // controller:
                                    //     _loginViewModel.userIdController,
                                    keyboardType: TextInputType.text,
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                  child: TextFormField(
                                    //readOnly: _loginViewModel.loggingIn,
                                    decoration: ThemeHelper()
                                        .textInputDecoration('Account Number',
                                            'Enter your account number'),
                                    validator: (v) {
                                      if (!RequiredValidator(
                                        errorText: '',
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
                                    // controller:
                                    //     _loginViewModel.userIdController,
                                    keyboardType: TextInputType.text,
                                  ),
                                  decoration:
                                      ThemeHelper().inputBoxDecorationShaddow(),
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                  child: TextFormField(
                                    maxLength: 11,
                                    //readOnly: _loginViewModel.loggingIn,
                                    decoration: ThemeHelper()
                                        .textInputDecoration('Phone Number',
                                            'Enter your phone number'),
                                    validator: (v) {
                                      if (!RequiredValidator(
                                        errorText: '',
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
                                    // controller:
                                    //     _loginViewModel.userIdController,
                                    keyboardType: TextInputType.text,
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
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Add a Delegate",
                                    style: TextStyle(
                                        color: kTextColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: kNormalText),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "These delegate will be attached to your account and are liable to withdraw on your behalf.",
                                    style: TextStyle(
                                        color: kTextColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: kNormalText),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () async {
                                        await AddDelegateModal.bottomModalPopup(
                                                context)
                                            .then((value) {
                                          setState(() {
                                            //var newValue = value as DelegateModel(f);
                                            firstDelegateData = value;
                                            firstDelegate = firstDelegateData ==
                                                    null
                                                ? ''
                                                : getInitials(firstDelegateData!
                                                        .firstName +
                                                    " " +
                                                    firstDelegateData!
                                                        .lastName);
                                          });
                                        });
                                      },
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 50,
                                                offset: const Offset(0, 30),
                                                color: kDarkGrayColor
                                                    .withOpacity(0.20),
                                              ),
                                            ],
                                            color: kYellowColor),
                                        child: firstDelegate.isEmpty
                                            ? const Icon(
                                                Icons.person_add,
                                                color: kWhiteColor,
                                                size: 30.0,
                                              )
                                            : Center(
                                                child: Text(
                                                  firstDelegate,
                                                  style: const TextStyle(
                                                      color: kWhiteColor,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: kDefaultFont),
                                                ),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await AddDelegateModal.bottomModalPopup(
                                                context)
                                            .then((value) {
                                          setState(() {
                                            //var newValue = value as DelegateModel(f);
                                            secondDelegateData = value;
                                            secondDelegate =
                                                secondDelegateData == null
                                                    ? ''
                                                    : getInitials(
                                                        secondDelegateData!
                                                                .firstName +
                                                            " " +
                                                            secondDelegateData!
                                                                .lastName);
                                          });
                                        });
                                      },
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 50,
                                                offset: const Offset(0, 30),
                                                color: kDarkGrayColor
                                                    .withOpacity(0.20),
                                              ),
                                            ],
                                            color: kYellowColor),
                                        child: secondDelegate.isEmpty
                                            ? const Icon(
                                                Icons.person_add,
                                                color: kWhiteColor,
                                                size: 30.0,
                                              )
                                            : Center(
                                                child: Text(
                                                  secondDelegate,
                                                  style: const TextStyle(
                                                      color: kWhiteColor,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: kDefaultFont),
                                                ),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await AddDelegateModal.bottomModalPopup(
                                                context)
                                            .then((value) {
                                          setState(() {
                                            //var newValue = value as DelegateModel(f);
                                            thirdDelegateData = value;
                                            thirdDelegate = thirdDelegateData ==
                                                    null
                                                ? ''
                                                : getInitials(thirdDelegateData!
                                                        .firstName +
                                                    " " +
                                                    thirdDelegateData!
                                                        .lastName);
                                          });
                                        });
                                      },
                                      child: Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 50,
                                                offset: const Offset(0, 30),
                                                color: kDarkGrayColor
                                                    .withOpacity(0.20),
                                              ),
                                            ],
                                            color: kYellowColor),
                                        child: thirdDelegate.isEmpty
                                            ? const Icon(
                                                Icons.person_add,
                                                color: kWhiteColor,
                                                size: 30.0,
                                              )
                                            : Center(
                                                child: Text(
                                                  thirdDelegate,
                                                  style: const TextStyle(
                                                      color: kWhiteColor,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: kDefaultFont),
                                                ),
                                              ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                AppButton(
                                  type: ButtonType.primary,
                                  text: "Create Account",
                                  onPressed: () {
                                    nextScreen(context, "/login");
                                  },
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
                                        "Already have an account? ",
                                        style: TextStyle(
                                          color: kTextColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          nextScreen(context, "/login");
                                        },
                                        child: const Text(
                                          "Login!",
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
