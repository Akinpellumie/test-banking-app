import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants.dart';
import '../../utils/helpers.dart';
import '../../widgets/app_button.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 100.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 150.0,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/cloth_faded.png"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SvgPicture.asset(
                    "assets/images/welcoming.svg",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    Text(
                      "Welcome to Test-Bank App!",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(19, 22, 33, 1),
                          ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "This is the first version of our Test-Bank App. Please login or register below.",
                      style: TextStyle(
                        color: Color.fromRGBO(74, 77, 84, 1),
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    // Let's create a generic button widget
                    AppButton(
                      text: "Log In",
                      type: ButtonType.plain,
                      onPressed: () {
                        nextScreen(context, "/login");
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    AppButton(
                      text: "Register",
                      type: ButtonType.primary,
                      onPressed: () {
                        nextScreen(context, "/register");
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
