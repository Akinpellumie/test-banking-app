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

int getHttpStatus(int status) {
  if (status == 401) {
    return 401;
  } else if (status >= 200 && status <= 209) {
    return 200;
  } else if (status >= 300 && status <= 309) {
    return 300;
  } else if (status >= 400 && status <= 409) {
    return 400;
  } else if (status >= 500 && status <= 509) {
    return 500;
  } else {
    return 0;
  }
}

List<String> getApiResponse(String value) {
  var val = value.replaceAll('"', '').replaceAll('[', '').replaceAll(']', '');
  var vals = val.split(",");
  return vals;
}
