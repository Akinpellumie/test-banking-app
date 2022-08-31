import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../helpers/theme_helper.dart';
import '../../utils/assets_path.dart';
import '../../utils/constants.dart';
import '../../utils/security_tip_modal.dart';
import '../../widgets/app_button.dart';
import '../../widgets/custom_back_button.dart';

class PayBillScreen extends StatefulWidget {
  const PayBillScreen({Key? key}) : super(key: key);

  @override
  State<PayBillScreen> createState() => _PayBillScreenState();
}

class _PayBillScreenState extends State<PayBillScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      SecurityTipModal.securityTipPopup(
        context,
        'SECURITY TIPS',
        'Use the Exit button to end each Online Banking session.\nDo not use the Back button to exit the site.\nBalance your account on a regular basis to make sure that no unauthorized transactions have taken place. \nInstall and maintain up-to-date operating system security patches and anti-virus software on your devices.',
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                          "Utility",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Buy airtime and pay utility bill at your convenience!",
                          style: TextStyle(
                            color: kWhiteColor,
                            fontWeight: FontWeight.normal,
                            fontSize: size.height * 0.0170,
                          ),
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
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          SvgPicture.asset(
                            AssetsPath.comingSoon,
                            height: size.height * 0.30,
                            width: size.width * 0.60,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "This Feature is \n Coming Soon!!!",
                            style: TextStyle(
                              color: kTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: size.height * 0.0250,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Flexible(
                  //   child: Container(
                  //     width: double.infinity,
                  //     constraints: BoxConstraints(
                  //       minHeight: MediaQuery.of(context).size.height - 100.0,
                  //     ),
                  //     decoration: const BoxDecoration(
                  //       borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(30.0),
                  //         topRight: Radius.circular(30.0),
                  //       ),
                  //       color: Colors.white,
                  //     ),
                  //     padding: const EdgeInsets.all(24.0),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.stretch,
                  //       children: [
                  //         const SizedBox(height: 5.0),
                  //         const Align(
                  //           alignment: Alignment.centerRight,
                  //           child: Text(
                  //             'Balance: N 500,000',
                  //             style: TextStyle(
                  //                 color: kTextColor,
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: kNormalText),
                  //           ),
                  //         ),
                  //         const SizedBox(height: 10.0),
                  //         Form(
                  //           //key: _loginViewModel.formKey,
                  //           child: Column(
                  //             children: [
                  //               Container(
                  //                 child: TextFormField(
                  //                   //readOnly: _loginViewModel.loggingIn,
                  //                   decoration: ThemeHelper()
                  //                       .amountInputDecoration(
                  //                           'Amount', 'Enter amount'),
                  //                   validator: (v) {
                  //                     if (!RequiredValidator(
                  //                       errorText: '',
                  //                     ).isValid(v)) {
                  //                       // _loginViewModel.setError(
                  //                       //   "User ID",
                  //                       //   'Enter a valid user ID',
                  //                       // );
                  //                     } else {
                  //                       // _loginViewModel
                  //                       //     .removeError("userId");
                  //                     }
                  //                     return null;
                  //                   },
                  //                   // controller:
                  //                   //     _loginViewModel.userIdController,
                  //                   keyboardType: TextInputType.text,
                  //                 ),
                  //                 decoration:
                  //                     ThemeHelper().inputBoxDecorationShaddow(),
                  //               ),
                  //               const SizedBox(height: 20.0),
                  //               Container(
                  //                 child: TextFormField(
                  //                   //readOnly: _loginViewModel.loggingIn,
                  //                   decoration: ThemeHelper()
                  //                       .textInputDecoration('Unique Number',
                  //                           'Enter unique number'),
                  //                   validator: (v) {
                  //                     if (!RequiredValidator(
                  //                       errorText: '',
                  //                     ).isValid(v)) {
                  //                       // _loginViewModel.setError(
                  //                       //   "User ID",
                  //                       //   'Enter a valid user ID',
                  //                       // );
                  //                     } else {
                  //                       // _loginViewModel
                  //                       //     .removeError("userId");
                  //                     }
                  //                     return null;
                  //                   },
                  //                   // controller:
                  //                   //     _loginViewModel.userIdController,
                  //                   keyboardType: TextInputType.text,
                  //                 ),
                  //                 decoration:
                  //                     ThemeHelper().inputBoxDecorationShaddow(),
                  //               ),
                  //               const SizedBox(height: 20.0),
                  //               AppButton(
                  //                 type: ButtonType.primary,
                  //                 text: "Continue",
                  //                 onPressed: () {
                  //                   //nextScreen(context, "/login");
                  //                 },
                  //               ),
                  //               const SizedBox(
                  //                 height: 20.0,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
