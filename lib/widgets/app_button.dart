import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

enum ButtonType { primary, plain }

class AppButton extends StatelessWidget {
  final ButtonType type;
  final VoidCallback onPressed;
  final String text;
  final bool loading;

  const AppButton({
    Key? key,
    required this.type,
    required this.onPressed,
    required this.text,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: getButtonColor(type),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(169, 176, 185, 0.42),
              spreadRadius: 0,
              blurRadius: 8.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Center(
          child: loading
              ? const SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(
                      Colors.white,
                    ),
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: getTextColor(type),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: kDefaultFont,
                  ),
                ),
        ),
      ),
    );
  }
}

Color getButtonColor(ButtonType type) {
  switch (type) {
    case ButtonType.primary:
      return kPrimaryColor;
    case ButtonType.plain:
      return Colors.white;
    default:
      return kPrimaryColor;
  }
}

Color getTextColor(ButtonType type) {
  switch (type) {
    case ButtonType.plain:
      return kPrimaryColor;
    case ButtonType.primary:
      return Colors.white;
    default:
      return Colors.white;
  }
}
