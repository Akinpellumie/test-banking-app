import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 50.0,
        width: 50.0,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kWhiteColor, width: 1.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(169, 176, 185, 0.42),
              spreadRadius: 0,
              blurRadius: 8.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: const Icon(
          Icons.keyboard_backspace_rounded,
          color: kWhiteColor,
          size: 30.0,
        ),
      ),
    );
  }
}
