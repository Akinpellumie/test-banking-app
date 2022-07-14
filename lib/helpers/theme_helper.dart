import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/constants.dart';

class ThemeHelper {
  InputDecoration textInputDecoration(
      [String lableText = "", String hintText = ""]) {
    return InputDecoration(
      iconColor: kPrimaryColor,
      labelText: lableText,
      labelStyle: const TextStyle(color: kTextColor, fontFamily: kDefaultFont),
      hintText: hintText,
      hintStyle: const TextStyle(color: kTextColor, fontFamily: kDefaultFont),
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: kPrimaryColor.withOpacity(0.5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: kPrimaryColor.withOpacity(0.5),
        ),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
    );
  }

  BoxDecoration inputBoxDecorationShaddow() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.025),
        blurRadius: 15,
        offset: const Offset(0, 2),
      )
    ]);
  }

  BoxDecoration buttonBoxDecoration(BuildContext context,
      [String color1 = "", String color2 = ""]) {
    Color c1 = kPrimaryColor;
    Color c2 = kPrimaryDarkColor;
    if (color1.isEmpty == false) {
      c1 = HexColor(color1);
    }
    if (color2.isEmpty == false) {
      c2 = HexColor(color2);
    }

    return BoxDecoration(
      // ignore: prefer_const_literals_to_create_immutables
      boxShadow: [
        const BoxShadow(
            color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 1.0],
        colors: [
          c1,
          c2,
        ],
      ),
      color: kPrimaryColor.withOpacity(0.3),
      borderRadius: BorderRadius.circular(20.0),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(const Size(50, 50)),
      backgroundColor: MaterialStateProperty.all(kSuccessColor),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  AlertDialog alartDialog(String title, String content, BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black38)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  InputDecoration amountInputDecoration(
      [String lableText = "", String hintText = "", String prefix = "N "]) {
    return InputDecoration(
      iconColor: kPrimaryColor,
      prefixText: prefix,
      labelText: lableText,
      labelStyle: const TextStyle(color: kTextColor, fontFamily: kDefaultFont),
      hintText: hintText,
      hintStyle: const TextStyle(color: kTextColor, fontFamily: kDefaultFont),
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: kPrimaryColor.withOpacity(0.5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: kPrimaryColor.withOpacity(0.5),
        ),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
    );
  }

  InputDecoration passwordInputDecoration(
      [String lableText = "", String hintText = "", Widget? suffixIcon]) {
    return InputDecoration(
      iconColor: kPrimaryColor,
      labelText: lableText,
      labelStyle: const TextStyle(color: kTextColor, fontFamily: kDefaultFont),
      hintText: hintText,
      hintStyle: const TextStyle(color: kTextColor, fontFamily: kDefaultFont),
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: kPrimaryColor.withOpacity(0.5),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: kPrimaryColor.withOpacity(0.5),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.red, width: 2.0),
      ),
      suffixIcon: suffixIcon,
    );
  }

  void setState(Null Function() param0) {}
}

class LoginFormStyle {}
