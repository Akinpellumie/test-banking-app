import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_banking_app/utils/constants.dart';
import 'package:mobile_banking_app/widgets/title_with_more_btn.dart';

import '../../utils/helpers.dart';
import '../../utils/snackbar_content_type.dart';
import '../../widgets/custom_snackbar.dart';
import '../../widgets/payment_history_list.dart';
import '../../widgets/box_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Track active index
  int activeIndex = 0;

  void _showsnackbar() {
    var snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: CustomSnackbar(
        title: 'SECURITY TIPS',
        message:
            'Do not respond to emails that claim to be from Test-Mobile Bank (or any other company) requesting your account details or login credentials (username/password). We will never ask for your personal information online.',

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
        //bottomNavigationBar: const BottomBar(),
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
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height * 0.25,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Welcome Back,\n",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                  TextSpan(
                                    text: "Akin!",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  )
                                ],
                              ),
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: kWhiteColor.withOpacity(0.35),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: kPrimaryColor,
                                spreadRadius: 0,
                                blurRadius: 8.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: const <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "N 500,000.00",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: kSubTitleText),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Account Balance",
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w300,
                                      fontSize: kNormalText - 3),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    width: double.infinity,
                    //height: MediaQuery.of(context).size.height - 200.0,
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 300.0,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      color: kBackgroundColor,
                    ),
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(
                                  left: kDefaultPadding,
                                  right: kDefaultPadding),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () =>
                                            nextScreen(context, "/send-money"),
                                        child: const BoxMenu(
                                          title: 'Send Money',
                                          iconData:
                                              CupertinoIcons.paperplane_fill,
                                          frameColor: kBlueColor,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            nextScreen(context, "/pay-bill"),
                                        child: const BoxMenu(
                                          title: 'Pay Bill',
                                          iconData: Icons.style_outlined,
                                          frameColor: kPinkColor,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            nextScreen(context, "/buy-airtime"),
                                        child: const BoxMenu(
                                          title: 'Buy Airtime',
                                          iconData: Icons.add,
                                          frameColor: kYellowColor,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            nextScreen(context, "/more"),
                                        child: const BoxMenu(
                                          title: 'More',
                                          iconData: Icons.more_horiz_outlined,
                                          frameColor: kPurpleColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  TitleWithMoreBtn(
                                    title: 'Payments',
                                    press: () =>
                                        nextScreen(context, "/payment-history"),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  const PaymentHistoryList(),
                                ],
                              ),
                            ),
                          ],
                        ),
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
