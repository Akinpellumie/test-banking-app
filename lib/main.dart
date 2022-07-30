import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_banking_app/screens/auth/change_password_screen.dart';
import 'package:mobile_banking_app/screens/auth/login_screen.dart';
import 'package:mobile_banking_app/screens/auth/register_screen.dart';
import 'package:mobile_banking_app/screens/delegate/delegate_access_screen.dart';
import 'package:mobile_banking_app/screens/home/home_screen.dart';
import 'package:mobile_banking_app/screens/others/more_option_screen.dart';
import 'package:mobile_banking_app/screens/others/payment_history_screen.dart';
import 'package:mobile_banking_app/screens/send/send_money_screen.dart';
import 'package:mobile_banking_app/screens/utility/buy_airtime_screen.dart';
import 'package:mobile_banking_app/screens/utility/pay_bill_screen.dart';
import 'package:mobile_banking_app/view_models/auth/login_view_model.dart';
import 'package:mobile_banking_app/view_models/auth/register_view_model.dart';
import 'package:mobile_banking_app/view_models/delegate/delegate_modal_view_model.dart';
import 'package:provider/provider.dart';

import 'screens/home/landing_screen.dart';
import 'utils/constants.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DelegateModalViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Test-Mobile Bank",
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.notoSansTextTheme().apply(
          bodyColor: kTextColor,
          displayColor: kPrimaryDarkColor,
        ),
      ),
      initialRoute: "/",
      onGenerateRoute: _onGenerateRoute,
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const LandingScreen();
      });
    case "/login":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const LoginScreen();
      });
    case "/home":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const HomeScreen();
      });
    case "/register":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const RegisterScreen();
      });
    case "/send-money":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const SendMoneyScreen();
      });
    case "/buy-airtime":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const BuyAirtimeScreen();
      });
    case "/pay-bill":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const PayBillScreen();
      });
    case "/more":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const MoreOptionScreen();
      });
    case "/payment-history":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const PaymentHistoryScreen();
      });
    case "/change-password":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const ChangePasswordScreen();
      });
    case "/delegate-access":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const DelegateAccessScreen();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return const LandingScreen();
      });
  }
}
