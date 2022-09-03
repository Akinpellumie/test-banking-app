import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mobile_banking_app/utils/helpers.dart';

import '../../database/delegate_database.dart';
import '../../helpers/theme_helper.dart';
import '../../model/delegate/delegate.dart';
import '../../utils/constants.dart';
import '../../utils/security_tip_modal.dart';
import '../../utils/shared_prefs.dart';
import '../../widgets/app_button.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/select_delegate_modal.dart';

class DelegateAccessScreen extends StatefulWidget {
  const DelegateAccessScreen({Key? key}) : super(key: key);

  @override
  State<DelegateAccessScreen> createState() => _DelegateAccessScreenState();
}

class _DelegateAccessScreenState extends State<DelegateAccessScreen> {
  late Delegate? selectedDelegate;
  bool isDelegateAdded = false;
  List<Delegate> delegates = [];
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      SecurityTipModal.securityTipPopup(
        context,
        'SECURITY TIPS',
        'Do not respond to emails that claim to be from Test Mobile Bank (or any other company) requesting your account details or login credentials (username/password). We will never ask for your personal information online.',
      );
    });
    getDelegates();
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
                          "Delegate Access",
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
                          "Give cash transfer access to delegate!",
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
                                GestureDetector(
                                  onTap: () async {
                                    if (delegates.isEmpty) {
                                      displayToast(
                                        'You have not added any delegates yet.',
                                        kYellowColor,
                                      );
                                      return;
                                    } else {
                                      await SelectDelegateModal
                                          .bottomModalPopup(
                                        context,
                                        delegates,
                                      ).then((value) {
                                        setState(() {
                                          selectedDelegate = value;
                                          isDelegateAdded = true;
                                        });
                                      });
                                    }
                                  },
                                  child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          isDelegateAdded
                                              ? selectedDelegate == null
                                                  ? 'Select Delegate'
                                                  : selectedDelegate!.fullname
                                              : 'Select Delegate',
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontFamily: kDefaultFont,
                                            fontWeight: FontWeight.normal,
                                            fontSize: kNormalText,
                                          ),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: kPrimaryColor, width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                  child: TextFormField(
                                    //readOnly: _loginViewModel.loggingIn,
                                    decoration: ThemeHelper()
                                        .textInputDecoration(
                                            'Description', 'Add a note'),
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
                                    displayToast(
                                      'This feature is not available at the moment. Please check back later!',
                                      kPrimaryDarkColor,
                                    );
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

  Future getDelegates() async {
    String userId = await SharedPrefs.getString('userID');
    delegates = await DelegateDatabase.instance.readAllDelegates(userId);
  }
}
