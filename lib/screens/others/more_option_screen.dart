import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_banking_app/screens/others/components/custom_list_menu_item.dart';
import 'package:mobile_banking_app/utils/helpers.dart';

import '../../utils/constants.dart';
import '../../utils/security_tip_modal.dart';
import '../../widgets/custom_back_button.dart';

class MoreOptionScreen extends StatefulWidget {
  const MoreOptionScreen({Key? key}) : super(key: key);

  @override
  State<MoreOptionScreen> createState() => _MoreOptionScreenState();
}

class _MoreOptionScreenState extends State<MoreOptionScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      SecurityTipModal.securityTipPopup(
        context,
        'SECURITY TIPS',
        'Do not respond to emails that claim to be from Test Mobile Bank (or any other company) requesting your account details or login credentials (username/password). We will never ask for your personal information online.',
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String acctNo = '1092802812';
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Akinlade Akinpelumi",
                                    style: TextStyle(
                                        fontFamily: kDefaultFont,
                                        color: kWhiteColor,
                                        fontSize: kNormalText + 3,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        acctNo,
                                        style: const TextStyle(
                                            fontFamily: kDefaultFont,
                                            color: kWhiteColor,
                                            fontSize: kNormalText - 3,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    GestureDetector(
                                      onTap: () => Clipboard.setData(
                                              ClipboardData(text: acctNo))
                                          .then(
                                        (value) {
                                          displayToast('copied to clipboard',
                                              kPrimaryDarkColor);
                                        },
                                      ),
                                      child: const Icon(
                                        Icons.copy_rounded,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Savings Account",
                                    style: TextStyle(
                                        fontFamily: kDefaultFont,
                                        color: kWhiteColor,
                                        fontSize: kNormalText - 3,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              padding: const EdgeInsets.all(5.0),
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: kWhiteColor, width: 2.0),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(30.0), //or 15.0
                                child: Image.asset(
                                  "assets/images/dp.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
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
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 15.0),
                          CustomListMenuItem(
                            iconData: Icons.switch_access_shortcut,
                            title: 'Change Password',
                            pressed: () =>
                                nextScreen(context, '/change-password'),
                          ),
                          const SizedBox(height: 10.0),
                          CustomListMenuItem(
                            iconData: Icons.history,
                            title: 'Payment History',
                            pressed: () =>
                                nextScreen(context, '/payment-history'),
                          ),
                          const SizedBox(height: 10.0),
                          CustomListMenuItem(
                            iconData: Icons.groups_outlined,
                            title: 'Delegate Access',
                            pressed: () =>
                                nextScreen(context, '/delegate-access'),
                          ),
                          const SizedBox(height: 10.0),
                          CustomListMenuItem(
                            iconData: Icons.logout,
                            title: 'Log Out',
                            pressed: () => nextScreen(context, '/'),
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
