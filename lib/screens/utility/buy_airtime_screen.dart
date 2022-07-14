import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../helpers/theme_helper.dart';
import '../../utils/constants.dart';
import '../../utils/snackbar_content_type.dart';
import '../../widgets/app_button.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/custom_snackbar.dart';

class BuyAirtimeScreen extends StatefulWidget {
  const BuyAirtimeScreen({Key? key}) : super(key: key);

  @override
  State<BuyAirtimeScreen> createState() => _BuyAirtimeScreenState();
}

class _BuyAirtimeScreenState extends State<BuyAirtimeScreen> {
   void _showsnackbar() {
    var snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: CustomSnackbar(
        title: 'SECURITY TIPS',
        message:
            'Use the Exit button to end each Online Banking session.\nDo not use the Back button to exit the site.\nBalance your account on a regular basis to make sure that no unauthorized transactions have taken place. \nInstall and maintain up-to-date operating system security patches and anti-virus software on your devices.',

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
                          "Buy Airtime",
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
                          "Buy airtime for family and friends!",
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
                          const SizedBox(height: 5.0),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Balance: N 500,000',
                              style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: kNormalText),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Form(
                            //key: _loginViewModel.formKey,
                            child: Column(
                              children: [
                                Container(
                                  child: TextFormField(
                                    //readOnly: _loginViewModel.loggingIn,
                                    decoration: ThemeHelper()
                                        .amountInputDecoration(
                                            'Amount', 'Enter amount'),
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
                                        .textInputDecoration('Phone Number',
                                            'Enter phone number'),
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
                                AppButton(
                                  type: ButtonType.primary,
                                  text: "Continue",
                                  onPressed: () {
                                    //nextScreen(context, "/login");
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
