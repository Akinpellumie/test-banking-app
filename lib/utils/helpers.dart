import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';

void nextScreen(BuildContext context, String route) {
  Navigator.of(context).pushNamed(route);
}

String getInitials(String fullname) => fullname.isNotEmpty
    ? fullname.trim().split(' ').map((l) => l[0]).take(2).join().toUpperCase()
    : '';

void displayToast(String msg, Color color) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: 4,
    backgroundColor: color,
    textColor: kWhiteColor,
    fontSize: kNormalText,
  );
}
